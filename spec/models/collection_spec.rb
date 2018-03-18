require 'rails_helper'

RSpec.describe Collection, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:torrents) }
  end
end
