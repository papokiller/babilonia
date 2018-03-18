require 'rest-client'

class Transmission::Client::TorrentDownload

  def download(path)
    Transmission::Client::Authenticate.get_token { |header| download_rpc(path, header) }
  end

  private

  def download_rpc(path, headers)
    request = RestClient.post('http://localhost:9091/transmission/rpc', payload(path), headers)
    request_response = JSON.parse(request.body)
    check_if_valid_torrent(request_response)
    check_if_duplicate_torrent(request_response)
    OpenStruct.new request_response['arguments']['torrent-added']
  end

  def check_if_valid_torrent(response)
    response['arguments'].blank? &&
      (raise Transmission::Client::Exceptions::TorrentInvalid)
  end

  def check_if_duplicate_torrent(response)
    response['arguments'].keys.first.eql?('torrent-duplicate') &&
      (raise Transmission::Client::Exceptions::TorrentDuplicate)
  end

  def payload(path)
    {
      method: 'torrent-add',
      arguments: {
        filename: path
      }
    }.to_json
  end

end



