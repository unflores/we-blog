require 'spec_helper'

describe Tweet do

  describe "self.pull_tweets" do

    before(:each) do
      Tweet.create(@saved_tweet)


@api_tweets = {}
@pulled_tweets = { 'statuses' => [] }

@api_tweets['saved'] = {
  "created_at" => "Wed Apr 06 17:53:35 +0000 2011", 
  "id"         => "1", 
  "text"       => "@davidpaullyons: Hope the bike is working well for you.", 
  "in_reply_to_screen_name" => "davidpaullyons", "retweet_count"=>"0", 
  "user" => { 
    "id"          => "16650474", 
    "name"        => "Austin David Flores", 
    "screen_name" => "unflores"
  } 
}

@api_tweets['new'] = {
  "created_at" => "Wed Apr 06 17:53:35 +0000 2011", 
  "id"         => "2", 
  "text"       => "Second pulled tweet.  yeyah", 
  "in_reply_to_screen_name" => "davidpaullyons", "retweet_count"=>"0", 
  "user" => { 
    "id"          => "16650474", 
    "name"        => "Austin David Flores", 
    "screen_name" => "unflores"
  } 
}

@api_tweets.each_value{ |val| @pulled_tweets['statuses'].push val }

@saved_tweet = {
  "created_at" => "Wed Apr 06 17:53:35 +0000 2011", 
  "twitter_id" => "55689622918934528",
  "status"     => "@davidpaullyons: Hope the bike is working well for you." 
}

    end

    it "should return an empty array if twitter throws an error" do
      HTTParty.stub!(:get).and_raise Exception 
      Tweet.pull_tweets.should == []
    end
    
    it "should save all new tweets to the database" do
      HTTParty.stub!(:get).and_return( @pulled_tweets )
      Tweet.import_statuses
      Tweet.count.should == 2
    end 
    
    it "should not save already saved tweets" do
      HTTParty.stub!(:get).and_return( @pulled_tweets )
      Tweet.import_statuses
      Tweet.find_all_by_twitter_id('1').count.should == 1
    end 
  end
end
