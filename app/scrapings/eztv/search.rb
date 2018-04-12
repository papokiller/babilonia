class Eztv::Search

  def search(keywords)
    search_url = "https://eztv.ag/search/#{keywords.squish.gsub(/\s/, '-')}"
    torrents = nil
    Mechanize.new.get(search_url) { |page| torrents = search_torrent(page) }
    torrents
  end

  private

  def search_torrent(page)
    torrents_elements_selector = 'tr[name="hover"]'
    page.search(torrents_elements_selector)
        .map { |element| build_torrent(element.search('td')) }
        # .group_by { |torrent| torrent.name.gsub(/[0-9]/, '') }
        # .values
        # .map { |torrents| torrents.sort { |a, b| episode(b) <=> episode(a) } }
        # .flatten
  end

  def episode(torrent)
    torrent.name
           .scan(/S([0-9])+E+([0-9][0-9])/)
           .flatten
           .map(&:to_i)
           .sum
  end

  def build_torrent(element)
    have_torrent = element[2].search('a').length >= 2
    ScrapingsFiles::Torrent.new(
      name: element[1].text.strip,
      torrent: have_torrent ? element[2].search('a')[1]['href'] : nil,
      magnet: have_torrent ? element[2].search('a')[0]['href'] : nil,
      provider: :eztv
    )
  end

end
