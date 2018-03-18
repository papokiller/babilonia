class VerifyCancelTorrentJob < ApplicationJob
  queue_as :verify_cancel_torrent_job

  def perform(*args)
    Collections::VerifyCancelTorrent.new.process!
  end

end
