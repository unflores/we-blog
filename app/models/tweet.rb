class Tweet < ActiveRecord::Base
  
  scope :most_recent, limit(5).order('created_at DESC')
  
end
