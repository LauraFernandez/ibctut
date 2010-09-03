class HomeController < ApplicationController
  def show
    render :text => 'Empezamos!'
  end
  def index
   respond_to do |format|
      format.html # index.html.erb
     
    end
  end
end
