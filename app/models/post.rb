class Post < ActiveRecord::Base
  validates_presence_of :body, :title
  
  scope :on_frontpage, where(:published => true).limit(5).order('posts.created_at DESC')
  scope :for_nav, where(:in_navigation => true)
  
  
end