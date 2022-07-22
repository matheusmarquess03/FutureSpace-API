module SpaceDevs
  class LauncherService
    def initialize()
      @url = "https://ll.thespacedevs.com/2.0.0/launch/?limit=2000&offset=20"
    end

    def call
      create_launchers_on_db
    end

    private
    attr_reader :url

    def create_launchers_on_db
      response = RestClient.get(url)
      @launchers = JSON.parse(response.body)['results']

      @launchers.each do |launcher|
        @launcher_field = Launcher.find_by(external_id: launcher['id'])
        if @launcher_field.present?
          :null
        else
          @launcher_field = Launcher.new(
            external_id: launcher['id'],
            url: launcher['url'],
            launch_library_id: launcher['launch_library_id'],
            slug: launcher['slug'],
            name: launcher['name'],
            net: launcher['net'],
            window_end: launcher['window_end'],
            window_start: launcher['window_start'],
            inhold: launcher['inhold'],
            tbdtime: launcher['tbdtime'],
            tbddate: launcher['tbddate'],
            probability: launcher['probability'],
            holdreason: launcher['holdreason'],
            failreason: launcher['failreason'],
            hashtag: launcher['hashtag'],
            map_image: launcher['map_image'],
            total_launch_count: launcher['total_launch_count'],
            webcast_live: launcher['webcast_live'],
            image: launcher['image'],
            webcast_live: launcher['webcast_live'],
            infographic: launcher['infographic'],
            program: launcher['program']
          )
          @launcher_field.save

          @status_field = Status.new(
            external_id: launcher['status']['id'],
            name: launcher['status']['name'],
            launcher_id: Launcher.last.id
          )
          @status_field.save

          @launch_service_provider_field = LaunchServiceProvider.new(
            external_id: launcher['launch_service_provider']['id'],
            url: launcher['launch_service_provider']['url'],
            name: launcher['launch_service_provider']['name'],
            type_launch_service_provider: launcher['launch_service_provider']['type'],
            launcher_id: Launcher.last.id
          )
          @launch_service_provider_field.save

          @rocket_field = Rocket.new(
            external_id: launcher['rocket']['id'],
            launcher_id: Launcher.last.id
          )
          @rocket_field.save

          @configuration_field = Configuration.new(
            external_id: launcher['rocket']['configuration']['id'],
            launch_library_id: launcher['rocket']['configuration']['launch_library_id'],
            url: launcher['rocket']['configuration']['url'],
            name: launcher['rocket']['configuration']['name'],
            family: launcher['rocket']['configuration']['family'],
            full_name: launcher['rocket']['configuration']['full_name'],
            variant: launcher['rocket']['configuration']['variant'],
            rocket_id: Rocket.last.id
          )
          @configuration_field.save

          @mission_field = Mission.new(
            external_id: launcher['mission']['id'],
            launch_library_id: launcher['mission']['launch_library_id'],
            description: launcher['mission']['description'],
            name: launcher['mission']['name'],
            launch_designator: launcher['mission']['launch_designator'],
            type_mission: launcher['mission']['type_mission'],
            launcher_id: Launcher.last.id
          )
          @mission_field.save

          @orbit_field = Orbit.new(
            external_id: launcher['mission']['orbit']['id'],
            name: launcher['mission']['orbit']['name'],
            abbrev: launcher['mission']['orbit']['abbrev'],
            mission_id: Mission.last.id
          )
          @orbit_field.save

          @pad_field = Pad.new(
            external_id: launcher['pad']['id'],
            agency_id: launcher['pad']['agency_id'],
            url: launcher['pad']['url'],
            name: launcher['pad']['name'],
            info_url: launcher['pad']['info_url'],
            wiki_url: launcher['pad']['wiki_url'],
            map_url: launcher['pad']['map_url'],
            latitude: launcher['pad']['latitude'],
            longitude: launcher['pad']['longitude'],
            map_image: launcher['pad']['map_image'],
            total_launch_count: launcher['pad']['total_launch_count'],
            launcher_id: Launcher.last.id
          )
          @pad_field.save

          @location_field = Location.new(
            external_id: launcher['pad']['location']['id'],
            url: launcher['pad']['location']['url'],
            country_code: launcher['pad']['location']['country_code'],
            name: launcher['pad']['location']['name'],
            map_image: launcher['pad']['location']['map_image'],
            total_launch_count: launcher['pad']['location']['total_launch_count'],
            total_landing_count: launcher['pad']['location']['total_landing_count'],
            pad_id: Pad.last.id
          )
          @location_field.save
        end
      end
    end
  end
end
