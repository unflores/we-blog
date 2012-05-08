require 'spec_helper'

describe SessionsController do
  describe '#create' do
    it "should store user's md5 password in the session password" do
      get :create, :password => 'password'
      session[:password].should == Digest::MD5.hexdigest('password')
    end

    it "should redirect admin user to posts path" do
      get :create, :password => 'password'
      response.should redirect_to(posts_path)
    end
    it 'should redirect to the sign in path on for a bad password' do
      get :create, :password => 'assword'
      response.should redirect_to(login_path)
    end
  end
end
