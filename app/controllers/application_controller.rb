class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :admin?, :navigation_items
  before_filter :tweets
  rescue_from ActionController::RoutingError, :with => :record_not_found
  rescue_from ActionView::MissingTemplate, :with => :record_not_found
  
  def navigation_items
    static_views = ::Rails.root.to_s + '/app/views/static/'
    @navigation_items ||= Dir.new(static_views).reject{|n| n[/^[\._0-9]/] }.collect do |n| 
      { :title => n[/[a-z\_]+/].humanize, :path => "/#{n[/[a-z\_]+/]}" } 
    end
  end

   def tweets
     @tweets ||= Tweet.most_recent
   end
  
  def admin_required
    unless admin?(session)
      flash[:error] = "You must be logged in to access this page."
      redirect_to new_session_path
    end
  end

  def admin?(session)
    session[:password] == (ENV['ADMIN_PASS'] or 'password')
  end
  
  def record_not_found
    render "static/404"
  end
end
