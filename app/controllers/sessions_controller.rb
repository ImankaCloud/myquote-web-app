class SessionsController < ApplicationController
  # Displays the login form
  def new
  end

  # Handles user login
  def create
    user = User.find_by(email: params[:email]) # Finds user by email
    if user && user.authenticate(params[:password]) && user.status == "Active"
      session[:user_id] = user.id # Sets user ID in session
      session[:first_name] = user.first_name # Sets user's first name in session
      session[:is_admin] = user.is_admin # Sets user's admin status in session
      if session[:is_admin] # Redirects to admin path if user is an admin
        redirect_to admin_path, notice: "Logged in successfully!"
      else
        redirect_to userhome_path, notice: "Logged in successfully!" # Redirects to user home path for regular users
      end
    else
      flash.now[:error] = "Invalid email or password. Please try again." # login fails
      render 'new' # Renders the login form again 
    end
  end

  # Handles user logout
  def destroy
    session[:user_id] = nil # Clears user ID from session
    session[:first_name] = nil # Clears user's first name from session
    session[:is_admin] = nil # Clears user's admin status from session
    redirect_to root_path, notice: "Logged out successfully!" # Redirects to root path after logout
  end
end
