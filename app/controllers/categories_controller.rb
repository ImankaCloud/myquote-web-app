class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ] # Sets @category for specified actions

  def index
    @categories = Category.all # Retrieves all categories
  end

  def show
  end

  def new
    @category = Category.new # Initializes a new category object
  end

  def edit
  end

  def create
    @category = Category.new(category_params) # Creates a new category with permitted parameters

    respond_to do |format|
      if @category.save
        format.html { redirect_to category_url(@category), notice: "Category was successfully created." } # Redirects on successful creation
        format.json { render :show, status: :created, location: @category } # Renders JSON response
      else
        format.html { render :new, status: :unprocessable_entity } # Renders new template on validation failure
        format.json { render json: @category.errors, status: :unprocessable_entity } # Renders JSON errors
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params) # Updates category with permitted parameters
        format.html { redirect_to category_url(@category), notice: "Category was successfully updated." } # Redirects on successful update
        format.json { render :show, status: :ok, location: @category } # Renders JSON response
      else
        format.html { render :edit, status: :unprocessable_entity } # Renders edit template on validation failure
        format.json { render json: @category.errors, status: :unprocessable_entity } # Renders JSON errors
      end
    end
  end

  def destroy
    @category.destroy # Destroys the category

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." } # Redirects after deletion
      format.json { head :no_content } # Renders empty JSON response
    end
  end

  private
  
    def set_category
      @category = Category.find(params[:id]) # Finds category by ID
    end

    def category_params
      params.require(:category).permit(:category_name) # Permits specified parameters
    end
end
