class Mission < ApplicationRecord
  belongs_to :launcher
  has_many :orbits, dependent: :destroy
end
