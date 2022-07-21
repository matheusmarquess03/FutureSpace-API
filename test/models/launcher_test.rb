class LauncherTest < ActiveSupport::TestCase
  test 'should save, an article' do
    launcher = Launcher.new(
      external_id: '6a7f56f9-2565-4b6c-b0c5-23e9c74a2368',
      url: 'https://ll.thespacedevs.com/2.0.0/launch/6a7f56f9-2565-4b6c-b0c5-23e9c74a2368/',
      launch_library_id: nil,
      slug: 'sputnik-8a91-d1-2',
      name: 'Sputnik 8A91 | D1- 2',
      net: '1958-05-15T07:12:00Z',
      window_end: '1958-05-15T07:12:00Z',
      window_start: '1958-05-15T07:12:00Z',
      inhold: false,
      tbdtime: false,
      tbddate: false,
      probability: nil,
      holdreason: nil,
      failreason: nil,
      hashtag: nil,
      map_image: 'https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_15_20200803142517.jpg',
      total_launch_count: 1532,
      webcast_live: false,
      image: 'https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/sputnik_8a91_image_20210830171943.png',
      infographic: nil,
      program: [],
      imported_t: Time.zone.now
      )

    assert launcher.save
  end
end
