class LaunchersController < ApplicationController
  before_action :set_launcher, only: [:show, :update, :destroy]

  # GET /launchers
  # GET /launchers.json
  def index
    @launchers = Launcher.all
  end

  # GET /launchers/1
  # GET /launchers/1.json
  def show
  end

  # POST /launchers
  # POST /launchers.json
  def create
    @launcher = Launcher.new(launcher_params)

    if @launcher.save
      render :show, status: :created, location: @launcher
    else
      render json: @launcher.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /launchers/1
  # PATCH/PUT /launchers/1.json
  def update
    if @launcher.update(launcher_params)
      render :show, status: :ok, location: @launcher
    else
      render json: @launcher.errors, status: :unprocessable_entity
    end
  end

  # DELETE /launchers/1
  # DELETE /launchers/1.json
  def destroy
    @launcher.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_launcher
      @launcher = Launcher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def launcher_params
      params.fetch(:launcher, {})
    end
end
