class Post < ActiveRecord::Base
  acts_as_taggable

  translates :title, :body


  validates_presence_of :body, :title
  validates_uniqueness_of :slug
  scope :live, where(:published => true).order('posts.created_at DESC')
  scope :for_nav, where(:in_navigation => true)
  
  before_save :create_slug
  
  self.per_page = 5
  
  def to_param
    slug
  end
  
  def create_slug
    self.slug = title.parameterize
  end
end