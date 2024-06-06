class QuoteCategoriesController < ApplicationController
  before_action :set_quote_category, only: %i[ show edit update destroy ]

  # Displays a list of all quote categories
  def index
    @quote_categories = QuoteCategory.all
  end

  # Displays details of a specific quote category
  def show
  end

  # Displays a form to create a new quote category
  def new
    @quote_category = QuoteCategory.new
  end

  # Displays a form to edit a quote category
  def edit
  end

  # Creates a new quote category
  def create
    @quote_category = QuoteCategory.new(quote_category_params)

    respond_to do |format|
      if @quote_category.save
        format.html { redirect_to quote_category_url(@quote_category), notice: "Quote category was successfully created." }
        format.json { render :show, status: :created, location: @quote_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quote_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # Updates a quote category
  def update
    respond_to do |format|
      if @quote_category.update(quote_category_params)
        format.html { redirect_to quote_category_url(@quote_category), notice: "Quote category was successfully updated." }
        format.json { render :show, status: :ok, location: @quote_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quote_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # Destroys a quote category
  def destroy
    @quote_category.destroy

    respond_to do |format|
      format.html { redirect_to quote_categories_url, notice: "Quote category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private


  def set_quote_category
    @quote_category = QuoteCategory.find(params[:id])
  end

  def quote_category_params
    params.require(:quote_category).permit(:quote_id, :category_id)
  end
end
