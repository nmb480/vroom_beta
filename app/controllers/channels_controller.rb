class ChannelsController < ApplicationController
  def index
    @vtubers = Channel.includes(:channel_statistic).all.order("channel_statistics.subscriberCount desc").page(params[:page]).per(20)
  end

  def show

    begin

      #channelId
      channelId = params[:id]
      @vtuber = Channel.find_by(channelId: channelId)

      @movies = @vtuber.movies
      if @movies.blank?
        #最新の動画を取得
        @movies = Movie.getMovieSnippet(channelId)
      end

      # config/initializers/twitter.rbの設定を読み込む
      t_client = get_twitter_service

      @channel_tweets = Tweet.get_usertimeline(t_client, @vtuber.get_channel_twitters(@vtuber.channelId))
      @tag_tweets = Tweet.get_tagtweets(t_client, @vtuber.get_hashtags(@vtuber.channelId))


    rescue Google::APIClient::TransmissionError => e

      puts e.result.body

    end

  end

  def new

    @vtuber = Channel.new

  end

  def create

    @vtuber = Channel.new(vtuber_params)
    @vtuber.save

    #snippet
    snippet = @vtuber.get_channel_snippet(@vtuber.channelId)
    @vtuber.update_attributes(channelTitle: snippet.title, thumbnail: snippet.thumbnails.medium.url, description: snippet.description, publishedAt: snippet.publishedAt)

    #statistics
    statistics = @vtuber.get_channel_statistics(@vtuber.channelId)
    @vtuber.create_channel_statistic(viewCount: statistics.viewCount, subscriberCount: statistics.subscriberCount, videoCount: statistics.videoCount)

    redirect_to channel_path(id: @vtuber.channelId)

  end

  def update
    @vtuber = Channel.find(params[:id])
    @vtuber.update_attributes(update_params)

    redirect_to edit_admin_path(@vtuber.id, channelId: @vtuber.channelId)
  end

  def destroy
    id = params[:id]
    @channel = Channel.find(id)
    @channel.destroy

    redirect_to admins_path
  end

  private

  def vtuber_params
    params.require(:channel).permit(:name, :channelId)
  end

  def update_params
    params.require(:channel).permit(:name)
  end
end
