class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :update, :destroy]

  # GET /missions
  # GET /missions.json
  def index
    @missions = Mission.all
  end

  # GET /missions/1
  # GET /missions/1.json
  def show
  end

  # POST /missions
  # POST /missions.json
  def create
    @mission = Mission.new(mission_params)

    if @mission.save
      render :show, status: :created, location: @mission
    else
      render json: @mission.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /missions/1
  # PATCH/PUT /missions/1.json
  def update
    if @mission.update(mission_params)
      render :show, status: :ok, location: @mission
    else
      render json: @mission.errors, status: :unprocessable_entity
    end
  end

  # DELETE /missions/1
  # DELETE /missions/1.json
  def destroy
    @mission.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mission
      @mission = Mission.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mission_params
      params.fetch(:mission, {})
    end
end
