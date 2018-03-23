class HomeController < ApplicationController

  def index
    # render json: {
    #   xd: Transmission::Client::TorrentList.new.get_torrents
    # } and return
    @torrents = Torrent.torrent_waiting_for_download
    @collections_count = Collection.count
    @torrents_downloads_count = @torrents.values.flatten.length
    @torrents_failds_count = Torrent.where(status: -1).count
  end

end
