set :output, 'log/cron.log'

ENV.each { |k, v| env(k, v) }

set :environment, :development

every :day, at: '9am' do
  rake 'db:update_launchers'
end
