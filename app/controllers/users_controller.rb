class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create] 
  before_action :set_user, only: [:show, :edit, :update, :destroy] 
  before_action :authorize_user, only: [:edit, :update, :destroy]

  # Displays a list of users if the current user is an admin
  def index
    if logged_in? && is_administrator?
      @users = User.all
    elsif logged_in?
      redirect_to userhome_path
    else
      flash[:error] = "You are not authorised to access this resource"
      redirect_to login_path
    end
  end

  # Displays a form to create a new user
  def new
    @user = User.new
  end

  # Creates a new user with default status 'Active' and redirects to login
  def create
    @user = User.new(user_params)
    @user.status ||= 'Active'
    if @user.save
      redirect_to login_path, notice: 'User was successfully created. Please log in.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  # Updates a user's details
  def update
    if @user.update(user_params)
      redirect_to userhome_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # Destroys a user
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # Authorizes actions on a user based on user role
  def authorize_user
    unless is_administrator? || @user == current_user
      redirect_to userhome_path, alert: "You are not authorised to perform this action."
    end
  end

  def user_params
    if is_administrator?
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :status, :is_admin)
    else
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation).merge(status: 'Active')
    end
  end
end
