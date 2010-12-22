class PostsController < ApplicationController
  before_filter :admin_required, :only => [ :index, :new, :edit,:create, :destroy, :update ]
  before_filter :get_resource, :only => [:show, :edit, :destroy, :update]
  def display
    @posts = Post.on_frontpage
    respond_to do |format| 
      format.html
      format.rss{ redirect_if_direct_request }
    end 
  end
  
  def index
    @posts = Post.all
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

  def tags
    @posts = Post.tagged_with(params[:name])
    render :display
  end

  def update
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
    @post.delete()
    redirect_to posts_path
  end

  private 
    def redirect_if_direct_request
      unless request.env['HTTP_USER_AGENT'] =~ /feedburner/i 
        # redirect_to 'http://feeds.feedburner.com/' and return
      end 
    end

    def get_resource; @post = Post.find(params[:id]) end
end
