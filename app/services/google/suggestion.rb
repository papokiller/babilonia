class Google::Suggestion
  def self.search(keyword)
    search = "http://suggestqueries.google.com/complete/search?client=firefox&q=#{keyword}"
    response = RestClient.get(search)
    data = JSON.parse(response.body)
    data[1] if data[1].is_a?(Array)
  end
end
