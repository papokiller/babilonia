require 'rails_helper'

RSpec.describe Torrent, type: :model do
  describe 'associations' do
    it { should belong_to(:torrentable) }
    it { should belong_to(:collection) }
  end

  describe 'class methods' do

    describe '#torrent_waiting_for_download' do
      let!(:collection) { create(:collection, :with_torrent) }
      let(:torrents_downloads) { described_class.torrent_waiting_for_download }
      it 'should show torrents waiting for download' do
        mock = instance_double(
          Transmission::Client::Torrent,
          id: collection.torrents.last.data[:id]
        )
        expect(Rails.cache).to receive(:fetch)
          .with('transmissions-downloads')
          .and_return([mock])
        expect(torrents_downloads.values.flatten.length).to eq(1)
      end
    end

  end
end
