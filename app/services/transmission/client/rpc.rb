module Transmission::Client::Rpc

  def self.torrents
    Transmission::Client::TorrentList.new.get_torrents
  end

  def self.download(torrent_url)
    Transmission::Client::TorrentDownload.new.download(torrent_url)
  end
end
