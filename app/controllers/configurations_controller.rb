class ConfigurationsController < ApplicationController
  before_action :set_configuration, only: [:show, :update, :destroy]

  # GET /configurations
  # GET /configurations.json
  def index
    @configurations = Configuration.all
  end

  # GET /configurations/1
  # GET /configurations/1.json
  def show
  end

  # POST /configurations
  # POST /configurations.json
  def create
    @configuration = Configuration.new(configuration_params)

    if @configuration.save
      render :show, status: :created, location: @configuration
    else
      render json: @configuration.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /configurations/1
  # PATCH/PUT /configurations/1.json
  def update
    if @configuration.update(configuration_params)
      render :show, status: :ok, location: @configuration
    else
      render json: @configuration.errors, status: :unprocessable_entity
    end
  end

  # DELETE /configurations/1
  # DELETE /configurations/1.json
  def destroy
    @configuration.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_configuration
      @configuration = Configuration.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def configuration_params
      params.fetch(:configuration, {})
    end
end
