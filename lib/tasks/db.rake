task update_launchers: :environment do
  ::SpaceDevs::LauncherService.new.call
end