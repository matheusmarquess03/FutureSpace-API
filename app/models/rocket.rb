class Rocket < ApplicationRecord
  belongs_to :launcher
  has_many :configurations
end
