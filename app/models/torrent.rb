class Torrent < ApplicationRecord
  belongs_to :torrentable, polymorphic: true
  belongs_to :collection,
             foreign_key: :torrentable_id,
             optional:  true

  def self.torrent_waiting_for_download
    merge_torrents_cache = lambda do |k, v|
      [k, from_transmission.select { |t| v.map { |tv| tv.data['id'] }.include?(t.id) }]
    end
    where(status: 0)
      .includes(:collection)
      .group_by { |torrent| torrent.collection.name }
      .map(&merge_torrents_cache)
      .to_h
  end

  def self.from_transmission
    Transmission::Client::Rpc.torrents
  end

end

