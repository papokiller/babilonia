class Collections::VerifyCancelTorrent
  def process!
    ids = Transmission::Client::Rpc.torrents.map(&:id)
    Torrent.where(status: 0)
           .each { |t| !ids.include?(t.data['id']) && t.update(status: -1) }
  end
end
