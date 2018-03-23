class TransmissionDownloadsMonitorJob < ApplicationJob
  queue_as :transmission_download_monitor

  def perform(*args)
    puts "working 10: "
    Rails.cache.read('transmissions-downloads')
    Rails.cache.write('transmissions-downloads', Transmission::Client::Base.new.torrents)
  end

end
