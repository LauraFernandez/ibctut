class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      puts @user_session.id
      flash[:notice] = "Successfully logged in."
      if session[:return_to].nil?
        redirect_to events_path
      else
        redirect_back_or_default
      end

      #redirect_to :controller=>"events"
    else

      render :action => 'new'

    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to :controller=>"events"
  end
end
