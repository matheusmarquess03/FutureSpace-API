class Launcher < ApplicationRecord
  has_many :statuses, dependent: :destroy
  has_many :launch_service_providers, dependent: :destroy
  has_many :rockets, dependent: :destroy
  has_many :missions, dependent: :destroy
  has_many :pads, dependent: :destroy

  accepts_nested_attributes_for :statuses, allow_destroy: true
  accepts_nested_attributes_for :launch_service_providers, allow_destroy: true
  accepts_nested_attributes_for :rockets, allow_destroy: true
  accepts_nested_attributes_for :missions, allow_destroy: true
  accepts_nested_attributes_for :pads, allow_destroy: true

  validates :external_id, presence: true

  before_save :set_imported_t
  # after_save :set_status
  enum status: %i[published draft trash]

  def set_imported_t
    self.imported_t = Time.zone.now
  end

  # def set_status
  #   if self.imported_t != nil
  #     self.status == 'published'
  #   else
  #     self.status == 'trash'
  #   end
  # end
end
