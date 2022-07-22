class LauncherSerializer < ActiveModel::Serializer
  attributes :id, :external_id, :url, :launch_library_id, :slug, :name, :statuses, :net, :window_end,
             :window_start, :inhold, :tbdtime, :tbddate, :probability, :holdreason, :failreason,
             :hashtag, :launch_service_providers, :rockets, :missions, :pads, :map_image, :total_launch_count, :webcast_live, :image, :infographic, :program,
             :imported_t, :status

  has_many :launch_service_providers
  has_many :statuses
  has_many :rockets
  has_many :missions
  has_many :pads

  def launch_service_providers
    object.launch_service_providers.map { |e| { id: e.external_id, url: e.url, name: e.name, type_launch_service_provider: e.type_launch_service_provider } }
  end

  def statuses
    object.statuses.map { |e| { id: e.external_id, name: e.name } }
  end

  def rockets
    object.rockets.map { |e| { id: e.external_id, configuration: e.configurations } }
  end

  def missions
    object.missions.map do |e|
      { id: e.external_id, launch_library_id: e.launch_library_id, name: e.name, description: e.description,
        launch_designator: e.launch_designator, type_mission: e.type_mission, orbit: e.orbits }
    end
  end

  def pads
    object.pads.map do |e|
      { id: e.external_id, url: e.url, agency_id: e.agency_id, name: e.name,
        info_url: e.info_url, map_url: e.map_url, longitude: e.longitude, latitude: e.latitude,
        map_image: e.map_image, total_launch_count: e.total_launch_count, location: e.locations
      }
    end
  end
end
