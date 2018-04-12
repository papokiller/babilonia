class Analysis::Series::Search
  attr_accessor :data

  def initialize(data:)
    @data = data
  end

  def season_and_episodes
    data
      .group_by { |episode| season(episode) }
      .map { |season, episode| build_season_with_episodes(season, episode) }
      .map { |season| order_episodes(season) }
  end

  private

  def order_episodes(season)
    season.episodes = season.episodes
                            .group_by { |data| data.name.gsub(/[0-9]/, '') }
                            .values
                            .map { |t| t.sort { |a, b| sort_episode(b, a) } }
                            .flatten
                            .map { |torrent| to_serie(torrent) }
    season
  end

  def to_serie(torrent)
    torrent
  end

  def sort_episode(a, b)
    episode(b) <=> episode(a)
  end

  def build_season_with_episodes(season_number, episodes)
    Analysis::Series::Season.new(
      number: season_number,
      episodes: episodes
    )
  end

  def season(episode)
    episode.name
           .scan(/S([0-9])+E+([0-9][0-9])/)
           .flatten
           .map(&:to_i)[0]
  end

  def episode(torrent)
    torrent.name
           .scan(/S([0-9])+E+([0-9][0-9])/)
           .flatten
           .map(&:to_i)[1]
  end

end
