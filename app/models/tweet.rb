class Tweet < ActiveRecord::Base
  
  scope :front_page, {
    :limit => 5,
    :order => 'created_at DESC'
  }
  
end