class TransmissionDownloadsMonitorJob < ApplicationJob
  queue_as :transmission_download_monitor

  def perform(*args)
    Rails.cache.write('transmissions-downloads', Transmission::Client::Base.new.torrents)
  end

end
