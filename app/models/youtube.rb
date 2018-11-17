class Youtube
  include ActiveModel::Model

  attr_accessor :q, :max_results, :regionCode

  def video_search(keyword,max_results = 25, regionCode = 'JP')

    # config/initializers/youtube.rbの設定を読み込む
    client, youtube = get_service

    # 検索開始
    client.execute!(
        :api_method => youtube.search.list,
        :parameters => {
          :part => 'snippet',
          :q => keyword,
          :maxResults => max_results,
          :regionCode => regionCode
        }
      )

  end

  def get_channel(channelid, regionCode = 'JP')

    # model/youtube.rbの設定を読み込む
    client, youtube = get_service

    # 検索開始
    client.execute!(
        :api_method => youtube.channels.list,
        :parameters => {
          :part => 'snippet',
          :id => channelid,
          :regionCode => regionCode
        }
      )

  end

  def get_vtubers()

    # model/youtube.rbの設定を読み込む
    client, youtube = get_service

    # 検索開始
    client.execute!(
        :api_method => youtube.subscriptions.list,
        :parameters => {
          :part => 'snippet',
          :id => ENV['YOUTUBE_MY_CHANNEL'],
          :regionCode => regionCode,
          :maxResults => 2
        }
      )

  end

end
