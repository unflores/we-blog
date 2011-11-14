class PostsController < ApplicationController
  before_filter :admin_required, :only => [ :index, :new, :edit, :create, :destroy, :update ]
  before_filter :get_resource, :only => [:show, :edit, :destroy, :update]
  def display
    @posts = Post.live.paginate(:page => params[:page])
    
    respond_to do |format| 
      format.html
      format.rss{ redirect_if_direct_request }
    end 
  end
  
  def index
    @posts = Post.order('posts.created_at DESC').all
  end
  
  def new
    @post = Post.new()
  end

  def create
    @post = Post.new(params['post'])
    if @post.save() 
    then redirect_to posts_path
    else redirect_to new_post_path end
  end

  def tag
    @posts = Post.live.tagged_with(params[:name]).paginate(:page => params[:page])
    render :display
  end
  
  def edit
  end

  def update
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @post.delete()
    redirect_to posts_path
  end

  private 
    def redirect_if_direct_request
      unless request.env['HTTP_USER_AGENT'] =~ /feedburner/i 
        redirect_to 'http://feeds.feedburner.com/AustinFlores' and return
      end 
    end

    def get_resource
      @post = Post.where(:slug => params[:id]).first
    end
end
