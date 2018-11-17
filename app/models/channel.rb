class Channel < ApplicationRecord
  #validation
 validates :channelId, presence: true

 has_many :channel_twitters, dependent: :destroy
 has_many :channel_hashtags, dependent: :destroy
 has_many :lives, class_name: 'Live', dependent: :destroy
 has_many :movies, dependent: :destroy

 has_one :channel_statistic, dependent: :destroy

 def self.updateAllChannels

   Channel.all.each do |vtuber|

     vtuber.updateChannels(vtuber.channelId)

   end

 end

 def updateChannels(channelId)

   @vtuber = Channel.find_by(channelId: channelId)

   #snippet
   snippet = @vtuber.get_channel_snippet(channelId)
   @vtuber.update_attributes(channelTitle: snippet.title, thumbnail: snippet.thumbnails.medium.url, description: snippet.description, publishedAt: snippet.publishedAt)

   #statistics
   statistics = @vtuber.get_channel_statistics(channelId)
   if @vtuber.channel_statistic
     @vtuber.channel_statistic.update_attributes(viewCount: statistics.viewCount, subscriberCount: statistics.subscriberCount, videoCount: statistics.videoCount)
   else
     @statistics = @vtuber.create_channel_statistic(viewCount: statistics.viewCount, subscriberCount: statistics.subscriberCount, videoCount: statistics.videoCount)
   end

 end

 #================================================== snippet
 #============================================================
 def get_channel_snippet(channelId)

   # config/initializers/youtube.rbの設定を読み込む
   client, youtube = get_service

   # 検索開始
   results = client.execute!(
       :api_method => youtube.channels.list,
       :parameters => {
         :part => 'snippet',
         :id   => channelId
       }
   )

   return results.data.items.first.snippet

 end

 #================================================== statistics
 #============================================================

 def get_channel_statistics(channelId)

   # config/initializers/youtube.rbの設定を読み込む
   client, youtube = get_service

   # 検索開始
   statistics = client.execute!(
       :api_method => youtube.channels.list,
       :parameters => {

         :part => 'statistics',
         :id   => channelId
       }
   )

   return statistics.data.items.first.statistics

 end

 #================================================== video
 #============================================================
 def self.get_uploads(channelId)

   # config/initializers/youtube.rbの設定を読み込む
   client, youtube = get_service

   #空の配列準備
   movies = []

   videos = client.execute!(
       :api_method => youtube.search.list,
       :parameters => {

         :part      => 'snippet',
         :channelId => channelId,
         :order     => 'date'
       }
   )

   videos.data.items.each do |video|
     movie = Movie.new()
     movie_info = movie.read(video)
     movies << movie_info
   end

   return movies

 end



 #================================================== channel_twitter
 #============================================================

 def get_channel_twitters(channelId)

   channel_twitter = []
   channel = Channel.find_by(channelid: channelId)

   channel.channel_twitters.each do |twitter|
       channel_twitter << twitter.screenName
   end

   return channel_twitter

 end


 #================================================== hashtag
 #============================================================

 def get_hashtags(id)

   hashtag = []
   channel = Channel.find_by(channelid: id)

   channel.channel_hashtags.each do |twitter|
       hashtag << twitter.hashtag
   end

   return hashtag

 end

 #================================================== hashtag
 #============================================================
 def self.getChannelPage(channelId)

    #必要情報を取得
    info       = Channel.get_channel_info(channelId)
    statistics = Channel.get_channel_statistics(channelId)

    # snippet
    description = info.snippet.description

    # statistics
    subscribercount = statistics.statistics.subscriberCount
    videocount      = statistics.statistics.videoCount

    #twitter
    channel_twitters = Channel.get_channel_twitter(channelId)
    hashtags         = Channel.get_hashtag(channelId)

    return {
      description: description,
      subscribercount: subscribercount,
      videocount: videocount,
      channel_twitters: channel_twitters,
      hashtags: hashtags
      }
  end

  #================================================== snippet
  #============================================================
  def self.get_channel_info(channelId)

    # config/initializers/youtube.rbの設定を読み込む
    client, youtube = get_service

    # 検索開始
    channel_info = client.execute!(
        :api_method => youtube.channels.list,
        :parameters => {

          :part => 'snippet',
          :id   => channelId
        }
    )

    return channel_info.data.items.first

  end

  #================================================== statistics
  #============================================================
  def self.get_channel_statistics(channelId)

    # config/initializers/youtube.rbの設定を読み込む
    client, youtube = get_service

    # 検索開始
    channel_statistics = client.execute!(
        :api_method => youtube.channels.list,
        :parameters => {

          :part => 'statistics',
          :id   => channelId
        }
    )

    return channel_statistics.data.items.first

  end

  #================================================== video
  #============================================================
  def self.get_uploads(channelId)

    # config/initializers/youtube.rbの設定を読み込む
    client, youtube = get_service

    #空の配列準備
    movies = []

    videos = client.execute!(
        :api_method => youtube.search.list,
        :parameters => {

          :part      => 'snippet',
          :channelId => channelId,
          :order     => 'date'
        }
    )

    videos.data.items.each do |video|
      movie = Movie.new()
      movie_info = movie.read(video)
      movies << movie_info
    end

    return movies

  end

  #================================================== channel_twitter
  #============================================================

  def self.get_channel_twitter(channelId)

    channel_twitter = []
    channel = Channel.find_by(channelid: channelId)

    channel.channel_twitters.each do |twitter|
      if twitter.regist_type == 'screen_name'
          channel_twitter << twitter.screen_name
      end
    end

    return channel_twitter

  end


  #================================================== hashtag
  #============================================================

  def self.get_hashtag(id)

    hashtag = []
    channel = Channel.find_by(channelid: id)

    channel.channel_twitters.each do |twitter|
      if twitter.regist_type == 'hashtag'
          hashtag << twitter.hashtag
      end
    end

    return hashtag

  end
end
