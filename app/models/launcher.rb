class Launcher < ApplicationRecord
  has_many :statuses
  has_many :launch_service_providers
  has_many :rockets
  has_many :rockets
  has_many :pads
end
