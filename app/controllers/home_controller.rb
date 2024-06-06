class HomeController < ApplicationController
  before_action :set_user, only: [:uquotes]

  # Displays the index page with public quotes
  def index
    @quotes = Quote.where(is_public: true).order(created_at: :desc).limit(5)
  end
  
  # Displays quotes associated with the current user
  def uquotes
    @quotes = @user.quotes
  end

  private

  # Sets @user based on the user ID stored in the session
  def set_user
    @user = User.find(session[:user_id])
  end
end
