require 'rest-client'
class Transmission::Client

  def torrents
    Transmission::Client::TorrentList.new.get_torrents
  end

  def download(torrent_url)
    Transmission::Client::TorrentDownload.new.download(torrent_url)
  end

end