class Tweet < ActiveRecord::Base
  
  named_scope :front_page, {
    :limit => 5,
    :order => 'created_at DESC'
  }
  
end