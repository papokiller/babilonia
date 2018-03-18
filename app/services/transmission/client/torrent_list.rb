require 'rest-client'

class Transmission::Client::TorrentList
  FIELDS = %i[id name totalSize addedDate isFinished files percentDone]

  def get_torrents(fields: [])
    Transmission::Client::Authenticate.get_token { |header| get_torrents_rpc(fields, header) }
  end

  private

  def get_torrents_rpc(fields, headers)
    response = RestClient.post('http://localhost:9091/transmission/rpc', payload(fields), headers)
    JSON.parse(response.body)['arguments']['torrents']
        .map { |raw_torrent| build_torrent(raw_torrent) }
  end

  def build_torrent(raw_torrent)
    Transmission::Client::Torrent.new(
      id:           raw_torrent['id'],
      name:         raw_torrent['name'],
      total_size:   raw_torrent['totalSize'],
      added_date:   raw_torrent['addedDate'],
      is_finished:  raw_torrent['isFinished'],
      files:        raw_torrent['files'],
      percent_done: raw_torrent['percentDone']
    )
  end

  def payload(fields)
    {
      method: 'torrent-get',
      arguments: {
        fields: FIELDS.concat(fields)
      }
    }.to_json
  end

end
