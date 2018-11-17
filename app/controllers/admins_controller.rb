class AdminsController < ApplicationController
  before_action :require_user_logged_in
  before_action :checkAdmmin

  def index

    @channels = Channel.includes(:channel_statistic).all.order("channel_statistics.subscriberCount desc").page(params[:page]).per(100)
    @channel  = Channel.new

  end

  def edit
    @channel = Channel.find_by(channelId: params[:channelId])
    @channel_twitter = @channel.channel_twitters.new
    @channel_hashtag = @channel.channel_hashtags.new
  end

  def create
  end

  def delete
  end

  def updateLives
    Live.getAllLives
    redirect_to root_path
  end

  def updateMovies
    Movie.getAllMovies
    redirect_to root_path
  end

  def updateChannels
    Channel.updateAllChannels
    redirect_to root_path
  end

  private

  def checkAdmmin
    unless current_user.user_level === "master"
      redirect_to root_path
    end
  end


end
