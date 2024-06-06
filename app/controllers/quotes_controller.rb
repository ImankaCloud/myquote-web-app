class QuotesController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :set_quote, only: [:show, :edit, :update, :destroy] 
  before_action :authorize_quote, only: [:edit, :update, :destroy]

  # Displays a form to create a new quote
  def new
    @quote = Quote.new
  end

  # Creates a new quote and associates it with the current user
  def create
    @quote = current_user.quotes.build(quote_params)
    if @quote.save
      redirect_to @quote, notice: 'Quote was successfully created.'
    else
      render :new
    end
  end

  # Displays a specific quote
  def show
    unless @quote.is_public || @quote.user == current_user
      redirect_to quotes_path, alert: "You are not authorized to view this quote."
    end
  end

  # Displays a form to edit a quote
  def edit
  end

  # Updates a quote
  def update
    if @quote.update(quote_params)
      redirect_to @quote, notice: 'Quote was successfully updated.'
    else
      render :edit
    end
  end

  # Destroys a quote
  def destroy
    @quote.destroy
    redirect_to quotes_url, notice: 'Quote was successfully destroyed.'
  end

  # Displays all public quotes
  def index
    @quotes = Quote.where(is_public: true).order(created_at: :desc)
  end

  # Displays quotes created by the current user
  def your_quotes
    @quotes = current_user.quotes.order(created_at: :desc)
  end

  private

  # Sets @quote based on the quote ID
  def set_quote
    @quote = Quote.find(params[:id])
  end

  # Authorizes actions on a quote based on user role
  def authorize_quote
    unless current_user == @quote.user || current_user.is_admin?
      redirect_to quotes_path, alert: "You are not authorized to perform this action."
    end
  end

  # Permits specified parameters for quotes
  def quote_params
    params.require(:quote).permit(:text, :publication_year, :comment, :is_public, :philosopher_id, category_ids: [])
  end
end
