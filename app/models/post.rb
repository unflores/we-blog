class Post < ActiveRecord::Base
  acts_as_taggable

  validates_presence_of :body, :title
  
  scope :live, where(:published => true).order('posts.created_at DESC')
  scope :for_nav, where(:in_navigation => true)
  
  self.per_page = 5
  
end