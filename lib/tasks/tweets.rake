namespace :tweets do
 
  desc "Pull tweet statuses from twitter"
  task :pull => :environment do
   Tweets.import_statuses 
  end
end

