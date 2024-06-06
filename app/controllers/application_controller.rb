class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :is_administrator?

  # Returns the currently logged-in user or nil if no user is logged in
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Checks if a user is logged in
  def logged_in?
    !current_user.nil?
  end

  # Checks if the logged-in user is an administrator
  def is_administrator?
    session[:is_admin]
  end

  private

  # Redirects to login page if user is not logged in
  def require_login
    unless logged_in?
      flash[:error] = "You are not permitted to access this resource"
      redirect_to login_path
    end
  end
end
