class Tweet < ActiveRecord::Base
  
  scope :most_recent, limit(5).order('created_at DESC')



  def self.pull_tweets
    since = Tweet.last.nil? ? "" : "&since_id=#{Tweet.last.twitter_id}"
    tweets = HTTParty.get "http://api.twitter.com/1/statuses/user_timeline.xml?screen_name=unflores#{since}"
    import_statuses tweets['statuses'] if tweets.size > 0
    rescue
      []
  end

  def self.import_statuses 
    pull_tweets.each do |status|  
      unless Tweet.where( :twitter_id => status['id'] ).size > 0
        Tweet.new(
          :twitter_id         => status['id'],
          :status             => status['text'],
          :twitter_created_at => status['created_at']
        ).save
      end
    end
  end
 
end
