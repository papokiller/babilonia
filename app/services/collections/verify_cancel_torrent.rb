class Collections::VerifyCancelTorrent
  def process!
    ids = Transmission::Client::Base.new.torrents.map(&:id)
    Torrent.where(status: 0)
           .each { |t| !ids.include?(t.data['id']) && t.update(status: -1) }
  end
end
