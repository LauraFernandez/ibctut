# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include ApplicationHelper
  include AuthenticatedSystem
  helper :all # include all helpers, all the time
  #  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  #  #before_filter :user_authenticated, :except=>[:logout,:new_session_path]
  #  # Scrub sensitive parameters from your log
  #  # filter_parameter_logging :password
  #
  #  def user_authenticated
  #    get_logged_in_user
  #    if @current_user.nil?
  #      session[:original_uri] = request.request_uri
  #      flash[:notice] = "You must login first."
  #      redirect_to '/login'#ew_session_path
  #    end
  #  end
  #
  #    def get_logged_in_user
  #      id = session[:user_id]
  #      unless id.nil?
  #        @current_user = User.find(id)
  #      end
  #    end
  filter_parameter_logging :password, :password_confirmation

  helper_method :current_user, :current_user_session

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end


  #
  #    def require_user
  #      unless current_user
  #        store_location
  #        flash[:notice] = "You must be logged in to access this page"
  #        redirect_to new_user_session_url
  #        return false
  #      end
  #    end

  def require_admin_user
    unless  admin?
      @user_session = UserSession.find
      @user_session.destroy unless @user_session.nil?
      store_location
      flash[:notice] = "You must be logged as admin to access this page"
      redirect_to new_user_session_url
      return false
    end
  end

  #    def require_no_user
  #      if current_user
  #        store_location
  #        flash[:notice] = "You must be logged out to access this page"
  #        redirect_to account_url
  #        return false
  #      end
  #    end
  #
  #     def store_location
  #      session[:return_to] = request.request_uri
  #    end

  #    def redirect_back_or_default(default=nil)
  #      redirect_to(session[:return_to] || default)
  #      session[:return_to] = nil
  #    end


end
