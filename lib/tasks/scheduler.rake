desc "This task is called by the Heroku scheduler add-on"
task :test_scheduler => :environment do
  puts "scheduler test"
  puts "it works."
end

task :update_lives => :environment do
  puts "Updating lives..."
  Live.getAllLives
  puts "done."
end

task :update_movies => :environment do
  puts "Updating movies..."
  Movie.getAllMovies
  puts "done."
end

task :update_channels => :environment do
  puts "Updating channels..."
  Channel.updateAllChannels
  puts "done."
end
