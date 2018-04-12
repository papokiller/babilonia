class Analysis::Series::Season
  attr_accessor :number, :episodes

  def initialize(number:, episodes: [])
    @numer = number
    @episodes = episodes
  end


end