class Tweet

  include ActiveModel::Model

  attr_accessor :name, :screen_name, :text, :icon, :items, :user_url, :datetime, :tweet_url

  def self.getAllTwitter
    # config/initializers/twitter.rbの設定を読み込む
    t_client = get_twitter_service

    Channel.all.each do |vtuber|

      @channel_tweets = Tweet.get_usertimeline(t_client, vtuber.get_channel_twitters(vtuber.channelId))
      @tag_tweets = Tweet.get_tagtweets(t_client, vtuber.get_hashtags(vtuber.channelId))

    end

  end


  def self.get_usertimeline(client, twitters)
  #タイムラインを取得するやーつ

    #空の配列（Tweet用）を準備
    tweets         = []
    o_tweets       = []  #検証用
    channel_tweet  = []
    channel_tweets = []

    count = 0

    twitters.each do |channel|

      #配列の初期化
      tweets         = []
      o_tweets       = []
      channel_tweet  = []

      #ユーザーのツイートを取得
      client.user_timeline( "#{channel}", {count: 5, exclude_replies: true} ).each do |timeline|
        twitter = Tweet.new()
        tweet = client.status(timeline.id, tweet_mode: "extended")
        tweet1 = twitter.tweet_read(tweet)
        tweets << tweet1

        o_tweets << tweet  #検証用

      end

      channel_tweet << count
      channel_tweet << channel
      channel_tweet << tweets

      count = count + 1

      channel_tweets << channel_tweet

    end



    return channel_tweets, o_tweets, channel_tweets

  end

  def self.get_tagtweets(client, hash_tag)
  # ハッシュタグのついーとを取得するやーつ

    #空の配列（Tweet用）を準備
    tag_tweets      = []
    o_tag_tweets    = []  #検証用
    hash_tag_tweet  = []
    hash_tag_tweets = []

    #カウンター（表示用）
    count = 0

    #ハッシュタグのついたツイートを取得
    hash_tag.each do |tag|

      tag_tweets      = []
      o_tag_tweets    = []
      hash_tag_tweet  = []

      #タグを持ったツイートを取得、リツイートは除く
      client.search("##{tag} exclude:retweets", tweet_mode: 'extended').take(5).each do |tag_tweet|
        twitter = Tweet.new()
        tweet2 = twitter.tweet_read(tag_tweet)
        tag_tweets << tweet2

        #検証用
        o_tag_tweets << tag_tweet

      end

      hash_tag_tweet << count
      hash_tag_tweet << tag
      hash_tag_tweet << tag_tweets

      count = count + 1

      #ツイートの配列を二次配列に入れる
      hash_tag_tweets << hash_tag_tweet

    end

    return tag_tweets, o_tag_tweets, hash_tag_tweets

  end

  def tweet_read(tweet)
    name        = tweet['user']['name']
    screenName = tweet['user']['screen_name']
    icon        = tweet['user']['profile_image_url'].to_s
    full_text   = tweet.attrs[:full_text]
    url         = tweet['id']
    tweetUrl   = "https://twitter.com/#{screenName}/status/#{url}"
    # created_at  = tweet['created_at']
    # datetime 　 = DateTime.parse(created_at).to_s

    @items = []
    tweet.media.each do |item|
      item_url = item[:media_url].to_s

      @items << item_url
    end

    return {
      name: name,
      screenName: screenName,
      icon: icon,
      text: full_text,
      items: @items,
      userUrl: "https://twitter.com/#{screenName}",
      tweetUrl: tweetUrl,
      # datetime: datetime
    }
  end


end
