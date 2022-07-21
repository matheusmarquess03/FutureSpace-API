class LaunchServiceProvidersController < ApplicationController
  before_action :set_launch_service_provider, only: [:show, :update, :destroy]

  # GET /launch_service_providers
  # GET /launch_service_providers.json
  def index
    @launch_service_providers = LaunchServiceProvider.all
  end

  # GET /launch_service_providers/1
  # GET /launch_service_providers/1.json
  def show
  end

  # POST /launch_service_providers
  # POST /launch_service_providers.json
  def create
    @launch_service_provider = LaunchServiceProvider.new(launch_service_provider_params)

    if @launch_service_provider.save
      render :show, status: :created, location: @launch_service_provider
    else
      render json: @launch_service_provider.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /launch_service_providers/1
  # PATCH/PUT /launch_service_providers/1.json
  def update
    if @launch_service_provider.update(launch_service_provider_params)
      render :show, status: :ok, location: @launch_service_provider
    else
      render json: @launch_service_provider.errors, status: :unprocessable_entity
    end
  end

  # DELETE /launch_service_providers/1
  # DELETE /launch_service_providers/1.json
  def destroy
    @launch_service_provider.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_launch_service_provider
      @launch_service_provider = LaunchServiceProvider.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def launch_service_provider_params
      params.fetch(:launch_service_provider, {})
    end
end
