class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login, :current_user

  protected

  def require_login
    if session[:user_id].nil?
      redirect_to sessions_new_path
    end
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
