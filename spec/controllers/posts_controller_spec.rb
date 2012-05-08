require 'spec_helper'

describe PostsController do
  describe '#display' do
    context 'format html' do
      it 'should respond with 200' do
        get :display, :format => 'html'
        response.status.should == 200
      end
    end
    context 'format rss' do
      it 'non feedburner user agent should redirect to feedburner url' do
        request.env['HTTP_USER_AGENT'] = 'derp'
        get :display, :format => 'rss'
        response.should redirect_to('http://feeds.feedburner.com/AustinFlores')
      end

      it 'feedburner user agent should render page' do
        request.env['HTTP_USER_AGENT'] = 'feedburner'
        get :display, :format => 'rss'
        response.status.should == 200
      end
    end
  end

  describe '#index' do
    context 'unauthenticated user' do
      it 'should redirect to new_session_path' do
        get :index
        response.should redirect_to(new_session_path)
      end
    end
  end
  describe '#destroy' do
    context 'unauthenticated user' do
      it 'should redirect to new_session_path' do
        delete :destroy, :id => 'id_not_touched'
        response.should redirect_to(new_session_path)
      end
    end
  end
end
