require 'rest-client'
class Transmission::Client::Base
  def torrents
    Transmission::Client::TorrentList.new.get_torrents
  end

  def find
  end
end