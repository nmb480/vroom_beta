class ToppagesController < ApplicationController
  def index

    begin

      now          = Time.now + 9.hours
      two_days_ago = now.ago(2.days)

      #最新の動画
      @movies = Movie.where(publishedAt: two_days_ago..now).order(publishedAt: :desc)

      #生配信を検索
      @lives = Live.all.order(publishedAt: :desc)


    rescue Google::APIClient::TransmissionError => e

      puts e.result.body

    end

  end

  def update
    Movie.getAllMovies
  end
end
