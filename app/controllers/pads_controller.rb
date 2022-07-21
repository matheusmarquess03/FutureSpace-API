class PadsController < ApplicationController
  before_action :set_pad, only: [:show, :update, :destroy]

  # GET /pads
  # GET /pads.json
  def index
    @pads = Pad.all
  end

  # GET /pads/1
  # GET /pads/1.json
  def show
  end

  # POST /pads
  # POST /pads.json
  def create
    @pad = Pad.new(pad_params)

    if @pad.save
      render :show, status: :created, location: @pad
    else
      render json: @pad.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pads/1
  # PATCH/PUT /pads/1.json
  def update
    if @pad.update(pad_params)
      render :show, status: :ok, location: @pad
    else
      render json: @pad.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pads/1
  # DELETE /pads/1.json
  def destroy
    @pad.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pad
      @pad = Pad.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pad_params
      params.fetch(:pad, {})
    end
end
