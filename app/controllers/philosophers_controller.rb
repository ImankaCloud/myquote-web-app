class PhilosophersController < ApplicationController
  before_action :set_philosopher, only: %i[ show edit update destroy ]

  # Displays a list of all philosophers
  def index
    @philosophers = Philosopher.all
  end

  # Displays details of a specific philosopher
  def show
  end

  # Displays a form to create a new philosopher
  def new
    @philosopher = Philosopher.new
  end

  # Displays a form to edit a philosopher
  def edit
  end

  # Creates a new philosopher
  def create
    @philosopher = Philosopher.new(philosopher_params)

    respond_to do |format|
      if @philosopher.save
        format.html { redirect_to philosopher_url(@philosopher), notice: "Philosopher was successfully created." }
        format.json { render :show, status: :created, location: @philosopher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @philosopher.errors, status: :unprocessable_entity }
      end
    end
  end

  # Updates a philosopher
  def update
    respond_to do |format|
      if @philosopher.update(philosopher_params)
        format.html { redirect_to philosopher_url(@philosopher), notice: "Philosopher was successfully updated." }
        format.json { render :show, status: :ok, location: @philosopher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @philosopher.errors, status: :unprocessable_entity }
      end
    end
  end

  # Destroys a philosopher
  def destroy
    @philosopher.destroy

    respond_to do |format|
      format.html { redirect_to philosophers_url, notice: "Philosopher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_philosopher
    @philosopher = Philosopher.find(params[:id])
  end

  def philosopher_params
    params.require(:philosopher).permit(:first_name, :last_name, :birth_year, :death_year, :biography)
  end
end
