class OrbitsController < ApplicationController
  before_action :set_orbit, only: [:show, :update, :destroy]

  # GET /orbits
  # GET /orbits.json
  def index
    @orbits = Orbit.all
  end

  # GET /orbits/1
  # GET /orbits/1.json
  def show
  end

  # POST /orbits
  # POST /orbits.json
  def create
    @orbit = Orbit.new(orbit_params)

    if @orbit.save
      render :show, status: :created, location: @orbit
    else
      render json: @orbit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orbits/1
  # PATCH/PUT /orbits/1.json
  def update
    if @orbit.update(orbit_params)
      render :show, status: :ok, location: @orbit
    else
      render json: @orbit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orbits/1
  # DELETE /orbits/1.json
  def destroy
    @orbit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orbit
      @orbit = Orbit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def orbit_params
      params.fetch(:orbit, {})
    end
end
