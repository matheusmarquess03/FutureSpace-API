class RocketsController < ApplicationController
  before_action :set_rocket, only: [:show, :update, :destroy]

  # GET /rockets
  # GET /rockets.json
  def index
    @rockets = Rocket.all
  end

  # GET /rockets/1
  # GET /rockets/1.json
  def show
  end

  # POST /rockets
  # POST /rockets.json
  def create
    @rocket = Rocket.new(rocket_params)

    if @rocket.save
      render :show, status: :created, location: @rocket
    else
      render json: @rocket.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rockets/1
  # PATCH/PUT /rockets/1.json
  def update
    if @rocket.update(rocket_params)
      render :show, status: :ok, location: @rocket
    else
      render json: @rocket.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rockets/1
  # DELETE /rockets/1.json
  def destroy
    @rocket.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rocket
      @rocket = Rocket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rocket_params
      params.fetch(:rocket, {})
    end
end
