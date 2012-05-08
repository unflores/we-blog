class SessionsController < ApplicationController  
  def create  
    session[:password] = Digest::MD5.hexdigest(params[:password])
    if admin?
      redirect_to posts_path, :notice => t('sign_in.success')
    else
      redirect_to login_path, :notice => t('sign_in.bad_password')
    end
  end  
    
  def destroy  
    reset_session
    redirect_to root_path, :notice => t('sign_in.signed_out')
  end  
end