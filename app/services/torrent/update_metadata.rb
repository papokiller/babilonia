class Torrent::UpdateMetadata

  def process
    update_metadata
  end

  def update_metadata
    torrents_on_transmissions.map { |torrent| sync_with_db_torrent(torrent) }
  end

  private

  def sync_with_db_torrent(torrent)
    find_torrent_by_metadata(torrent).update(data: torrent)
  end

  def find_torrent_by_metadata(metadata)
    Torrent.find_by!("data->>'id' = '?'", metadata.id)
  end

  def torrents_on_transmissions
    Transmission::Client::Rpc.torrents
  end

end
