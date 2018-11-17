class Live < ApplicationRecord
  validates :videoId, presence: true
  validates :title, presence: true
  validates :thumbnail, presence: true

  belongs_to :channel

  def self.getAllLives
    #一旦tableの中身を全部消す
    Live.delete_all()

    # config/initializers/youtube.rbの設定を読み込む
    client, youtube = get_service

    #DBに登録されているvtuber全員分の生放送を検索する。
    vtubers = Channel.all
    vtubers.each do |vtuber|

      #search.listから生配信を検索
      live_result = client.execute!(
          :api_method => youtube.search.list,
          :parameters => {
            :part          => 'snippet',
            :channelId     => vtuber['channelId'],
            :eventType     => 'live',
            :type          => 'video'

          }
      )

      #帰ってきた結果に対して、空白でなければDBに格納する
      result = live_result.data.items.first
      unless result.blank?
        @live = vtuber.lives.build(Live.read(result))
        @live.save
      end


    end

  end

  def self.read(result)
    videoid       = result['id']['videoId']
    title        = result['snippet']['title']
    thumbnail    = result['snippet']['thumbnails']['medium']['url']
    publishedAt  = result['snippet']['publishedAt'].in_time_zone('Tokyo')

    return {
      videoId: videoid,
      title: title,
      thumbnail: thumbnail,
      publishedAt: publishedAt,
    }
  end
end
