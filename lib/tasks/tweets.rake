namespace :tweets do
 
  desc "Pull tweet statuses from twitter"
  task :pull => :environment do
   Tweet.import_statuses 
  end
end

