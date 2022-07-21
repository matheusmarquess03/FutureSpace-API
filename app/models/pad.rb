class Pad < ApplicationRecord
  belongs_to :launcher
  has_many :locations
end
