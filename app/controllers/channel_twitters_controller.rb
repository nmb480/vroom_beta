class ChannelTwittersController < ApplicationController
  def new

    id = params[:id]
    @channel = Channel.find_by(channelId: id)

    @twitters = []
    @hashtags = []
    @channel.channel_twitters.each do |channel_twitter|
      @twitters << channel_twitter
    end
    @channel.channel_hashtags.each do |channel_hashtag|
      @hashtags << channel_hashtag
    end

    @channel_twitter  = @channel.channel_twitters.build
    @channel_twitters = @channel.channel_twitters.all
    @channel_hashtag  = @channel.channel_hashtags.build
    @channel_hashtags = @channel.channel_hashtags.all

  end

  def create
    regist_type = params[:regist_type]

    case regist_type
    when "screenName"
      channelId = params[:channel_twitter][:channelId]
      channel = Channel.find_by(channelid: channelId)
      @channel_twitter = channel.channel_twitters.build(twitter_params)
      @channel_twitter.save
    when "hashtag"
      channelId = params[:channel_hashtag][:channelId]
      channel = Channel.find_by(channelid: channelId)
      @channel_hashtag = channel.channel_hashtags.build(hashtag_params)
      @channel_hashtag.save
    end

    redirect_to edit_admin_path(channelId:channel.channelId)

  end

  def destroy
    channelId   = params[:channel_id]
    id          = params[:id]
    regist_type = params[:regist_type]

    channel = Channel.find(channelId)
    case regist_type
    when "screenName"
      twitter = channel.channel_twitters.find(id)
      twitter.destroy
    when "hashtag"
      twitter = channel.channel_hashtags.find(id)
      twitter.destroy
    end

    redirect_to edit_admin_path(channelId:channel.channelId)

  end

  private

  def twitter_params
    params.require(:channel_twitter).permit(:screenName)
  end

  def hashtag_params
    params.require(:channel_hashtag).permit(:hashtag)
  end
end
