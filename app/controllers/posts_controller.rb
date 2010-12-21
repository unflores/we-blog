class PostsController < ApplicationController
  before_filter :admin_required, :except => [ :display, :show, :tags ]
  def display
    @posts = Post.on_frontpage
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new()
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params['post'])
    if @post.save()
      redirect_to posts_path
    else
      redirect_to new_post_path
    end
  end

  def tags
    @posts = Post.tagged_with(params[:name])
    render :display
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params['id'])
    @post.delete()
    redirect_to posts_path
  end

end
