class RocketSerializer < ActiveModel::Serializer
  attributes :id, :configurations
  has_many :configurations
end
