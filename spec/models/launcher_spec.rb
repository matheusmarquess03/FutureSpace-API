require 'rails_helper'

RSpec.describe Launcher, type: :model do
  subject(:launcher) { create :launcher }

  describe '.validates' do
    before { launcher }

    it { is_expected.to validate_presence_of(:external_id) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:statuses) }
    it { is_expected.to have_many(:launch_service_providers) }
    it { is_expected.to have_many(:rockets) }
    it { is_expected.to have_many(:rockets) }
    it { is_expected.to have_many(:pads) }
  end

  describe '.hooks' do
    it { expect(launcher.imported_t).not_to be_nil }
  end
end
