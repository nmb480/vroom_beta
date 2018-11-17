require "#{Rails.root}/app/models/live.rb"
require "#{Rails.root}/app/models/movie.rb"
require "#{Rails.root}/app/models/channel_statistic.rb"

class Tasks::Cron

  def self.getAllLives
   #modelやlibのメソッド呼んだり
    Live.getAllLives
    #putsしてみたり
    puts "成功しました！"
  end

  def self.getAllMovies
   #modelやlibのメソッド呼んだり
    Movie.getAllMovies
    #putsしてみたり
    puts "成功しました！"
  end

  def self.updateAllChannels
    #modelやlibのメソッド呼んだり
    Channel.updateAllChannels
    #putsしてみたり
    puts "成功しました！"
  end

end
