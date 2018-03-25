class TorrentUpdateMetadataJob < ApplicationJob
  queue_as :torrent_update_metadata

  def perform(*args)
    Torrent::UpdateMetadata.new.process
  end

end
