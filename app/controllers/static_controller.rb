class StaticController < ApplicationController
  def show
    render :action => params[:page_name]
  end
end
