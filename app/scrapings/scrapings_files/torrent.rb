class ScrapingsFiles::Torrent
  attr_accessor :name, :magnet, :torrent, :provider

  def initialize(name:, torrent:, magnet: nil, provider: nil)
    @name = name
    @torrent = torrent
    @magnet = magnet
    @provider = provider
  end

end
