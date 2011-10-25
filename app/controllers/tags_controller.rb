class TagsController < ApplicationController
  def index
    @tags = Tag.find(:all,:conditions => ['name LIKE ?', "#{params[:q]}%"], :select => :name, :order => 'name')
    respond_to do |format| 
      format.html
      format.json{ render :json => @tags.map(&:name).to_json }
    end
  end
end
