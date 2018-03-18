class Collections::AddTorrent
  attr_accessor :collection, :torrent_link

  def initialize(collection:, torrent_link:)
    @collection = collection
    @torrent_link = torrent_link
  end

  def process
    ActiveRecord::Base.transaction do
      torrent_metedata = download_torrent!
      collection.torrents.create!(
        data: torrent_metedata.to_h
      )
    end
  end

  def download_torrent!
    torrent_client.download(torrent_link)
  end

  def torrent_client
    @torrent_client ||= Transmission::Client.new
  end

end
