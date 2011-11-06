class AddSlugToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :slug, :string, :null => false, :default => ""
    
    Post.all.each do |post|
      post.slug = post.title.parameterize
      post.save
    end
      
  end

  def self.down
    remove_column :posts, :slug
  end
end
