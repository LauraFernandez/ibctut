# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def admin?
    #@controller.send(:require_admin_user)
    (!current_user.nil?) && current_user.admin? ? true:false
  end

#  def user_in_session?
#    current_user.nil? ? false:true
#  end

#  def session_user_name
#    current_user.username
#  end
end
