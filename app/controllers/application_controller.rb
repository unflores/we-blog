class ApplicationController < ActionController::Base
  protect_from_forgery
  def navigation_items
    @navigation_items ||= Post.for_nav
  end

  # def tweets
  #   @tweets ||= Tweet.front_page
  # end

  def admin_required
    unless admin?(session)
      flash[:error] = "You must be logged in to access this page."
      redirect_to new_session_path
    end
  end

  def admin?(session)
    session[:password] == ENV['ADMIN_PASS']
  end
end
