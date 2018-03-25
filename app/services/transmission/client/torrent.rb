class Transmission::Client::Torrent
  attr_accessor :id, :name, :total_size, :added_date,
                :is_finished, :files, :percent_done

  def initialize(id:, name:, total_size:, added_date:,
                is_finished:, files:, percent_done:)
    @id = id
    @name = name
    @total_size = total_size
    @added_date = added_date
    @is_finished = is_finished
    @files = files
    @percent_done = (percent_done * 100).round(1)
  end

  def destroy
  end
end
