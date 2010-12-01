class PostsController < ApplicationController
  def display
    @posts = Post.on_frontpage
  end

  def show
  end

  def new
    @post = Post.new()
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

end
