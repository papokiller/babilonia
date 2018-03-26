class Torrent < ApplicationRecord
  belongs_to :torrentable, polymorphic: true
  belongs_to :collection,
             foreign_key: :torrentable_id,
             optional:  true

  def self.torrent_waiting_for_download
    torrents = from_transmission
    where(status: 0)
      .includes(:collection)
      .group_by { |torrent| torrent.collection.name }
      .map do |k, v|
        [k, torrents.select { |t| v.map { |tv| tv.data['id'] }.include?(t.id) }]
      end
      .to_h
  end

  def self.from_transmission
    Transmission::Client::Rpc.torrents
  end

end

