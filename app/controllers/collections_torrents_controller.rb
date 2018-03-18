class CollectionsTorrentsController < ApplicationController
  def add_torrents_to_collection
    @collection = Collection.find(torrent_to_collection_params[:collection_id])
    @torrent_url = torrent_to_collection_params[:torrent]
    service = Collections::AddTorrent.new(
      collection: @collection,
      torrent_link: @torrent_url
    )
    service.process
  end

  private

  def torrent_to_collection_params
    params.require(:torrent).permit(:collection_id, :torrent)
  end

end
