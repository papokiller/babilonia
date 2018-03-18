class HomeController < ApplicationController

  def index
    @torrents = Torrent.torrent_waiting_for_download
    @collections_count = Collection.count
    @torrents_downloads_count = @torrents.values.flatten.length
    @torrents_failds_count = Torrent.where(status: -1).count
  end

end
