class LaunchersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_launcher, only: [:show, :update, :destroy]

  def index
    launchers = Launcher.all.pagina(params[:page]).per(per)
    render json: {
      registros: launchers.total_count,
      resultado: ActiveModelSerializers::SerializableResource.new(launchers)
    }
  end

  def show
    if @launcher.present?
      render json: @launcher
    else
      render json: @launcher.errors, status: :unprocessable_entity
    end
  end

  def create
    @launcher = Launcher.new(launcher_params)

    if @launcher.save
      render json: @launcher, status: :created, location: @launcher
    else
      render json: @launcher.errors, status: :unprocessable_entity
    end
  end

  def update
    if @launcher.update_attributes(launcher_params)
      render json: @launcher.reload
    else
      render json: { error: @launcher.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @launcher.destroy

    head :no_content
  end

  private
  def set_launcher
    @launcher = Launcher.find(params[:id])
  end

  def launcher_params
    params.permit(:id, :external_id, :url, :launch_library_id, :slug, :name, :net, :window_end,
                                     :window_start, :inhold, :tbdtime, :tbddate, :probability, :holdreason, :failreason,
                                     :hashtag, :map_image, :total_launch_count, :webcast_live, :image, :infographic, :program)
  end
end
