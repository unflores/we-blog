class SessionsController < ApplicationController  
  def create  
    session[:password] = params[:password]  
    flash[:notice] = 'Successfully logged in'  
    redirect_to :controller => 'posts', :action => 'display'
  end  
    
  def destroy  
    reset_session
    flash[:notice] = 'Successfully logged out'  
    redirect_to :controller => 'posts', :action => 'display'
  end  
end