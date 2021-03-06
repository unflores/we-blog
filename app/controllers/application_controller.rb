class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :admin?, :navigation_items, :tweets
  rescue_from ActionController::RoutingError, :with => :record_not_found
  rescue_from ActionView::MissingTemplate, :with => :record_not_found
  
  def navigation_items
    Post.where(:published => false, :in_navigation => true)
  end

  # def tweets
  #   @tweets ||= Tweet.front_page
  # end
  
  def admin_required
    unless admin?
      flash[:error] = "You must be logged in to access this page."
      redirect_to new_session_path
    end
  end

  def admin?
    session[:password] == Digest::MD5.hexdigest(ENV['ADMIN_PASS'] || 'password')
  end
  
  def record_not_found
    render "static/404"
  end
end
