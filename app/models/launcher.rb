class Launcher < ApplicationRecord
  has_many :statuses
  has_many :launch_service_providers
  has_many :rockets
  has_many :rockets
  has_many :pads

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
