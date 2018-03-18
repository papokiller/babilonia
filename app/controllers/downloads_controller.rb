class DownloadsController < ApplicationController
  def index
    @torrents = Rails.cache.fetch("transmissions-downloads") || []
  end
end