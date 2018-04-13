class SearchController < ApplicationController
  def index
    @keywords = params[:keywords]
    @torrents = @keywords.present? ? Eztv::Search.new.search(@keywords) : []
  end
end
