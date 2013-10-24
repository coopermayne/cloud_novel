class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_user_name

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user_name
    u = current_user

    if u.email
      name = u.email
      name.slice!(name.index("@"), name.size)
    elsif u.authentications.size > 0
      name = u.authentications.first.username
    else
      name = "anonymous"
    end
    name
  end
  
end
