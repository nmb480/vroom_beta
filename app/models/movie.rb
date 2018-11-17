class Movie < ApplicationRecord
  validates :videoId, presence: true
  validates :title, presence: true
  validates :thumbnail, presence: true
  validates :publishedAt, presence: true

  belongs_to :channel

  attr_accessor :channelId, :viewCount, :likeCount, :commentCount

  def self.getAllMovies

    @movies = []

    # config/initializers/youtube.rbの設定を読み込む
    client, youtube = get_service

    #DBに登録されているvtuber全員分の生放送を検索する。
    Channel.all.each do |vtuber|

      #search.listから生配信を検索
      results = client.execute!(
          :api_method => youtube.search.list,
          :parameters => {
            :part          => 'snippet',
            :channelId     => vtuber['channelId'],
            :maxResults    => 7,
            :type          => 'video',
            :order         => 'date'
          }
      )

      results.data.items.each do |result|
        video = Movie.snippet_read(result)
        @movies << video
      end
    end

    #一旦tableの中身を全部消す
    Movie.delete_all()

    @movies.each do |movie|

      vtuber = Channel.find_by(channelId: movie[:channelId])
      begin
        vtuber.movies.create(videoId: movie[:videoId], title: movie[:title], thumbnail: movie[:thumbnail], publishedAt: movie[:publishedAt])
      rescue
       next
      end
    end
  end

  def self.getMovieSnippet(channelId)

    vtuber = Channel.find_by(channelId: channelId)

    # config/initializers/youtube.rbの設定を読み込む
    client, youtube = get_service

    #search.listから生配信を検索
    results = client.execute!(
        :api_method => youtube.search.list,
        :parameters => {
          :part          => 'snippet',
          :channelId     => channelId,
          :maxResults    => 7,
          :type          => 'video',
          :order         => 'date'
        }
    )

    #結果を配列に格納
    movies = []
    results.data.items.each do |result|
      movie = vtuber.movies.build(Movie.snippet_read(result))
      movies << movie
    end

    return movies

  end

  def get_movies_statistics
    # config/initializers/youtube.rbの設定を読み込む
    client, youtube = get_service

    #search.listから生配信を検索
    result = client.execute!(
      :api_method => youtube.search.list,
      :parameters => {
        :part   => 'statistics',
        :id     => @videoId,
      }
    )

    statistics = result.data.items.first

    return statistics_read(statistics)

  end

  def self.snippet_read(video)
    videoId     = video['id']['videoId']
    title       = video['snippet']['title']
    thumbnail   = video['snippet']['thumbnails']['medium']['url']
    publishedAt = video['snippet']['publishedAt'].in_time_zone('Tokyo')
    channel     = video['snippet']['channelId']

    return {
      channelId: channel,
      videoId: videoId,
      title: title,
      thumbnail: thumbnail,
      publishedAt: publishedAt
    }
  end

  def self.statistics_read(video)
    viewCount    = video['statistics']['viewCount']
    likeCount    = video['statistics']['likeCount']
    commentCount = video['statistics']['commentCount']

    return {
      viewCount: viewCount,
      likeCount: likeCount,
      commentCount: commentCount,
    }
  end
end
