class PostsController < ApplicationController
  def display
    @posts = Post.on_frontpage
  end

  def show
  end
  
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new()
  end

  def edit
  end

  def create
    @post = Post.new(params['post'])
    if @post.save()
      redirect_to posts_path
    else
      redirect_to new_post_path
    end
  end

  def update
  end

  def destroy
    @post = Post.find(params['id'])
    @post.delete()
    redirect_to posts_path
  end

end
