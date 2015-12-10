require 'httparty'
require 'json'
require 'active_support/core_ext/hash'

artist = "Metallica"

response = HTTParty.get("http://api.setlist.fm/rest/0.1/search/setlists",
:query => {:artistName => artist})
set = JSON.parse(Hash.from_xml(response.body).to_json)
set["setlists"]["setlist"].compact.each do |setlist|
  if setlist["artist"]["name"] == artist && !setlist.compact["sets"].nil?
    setlist.compact["sets"]["set"].each { |songs| puts songs["song"] }
  end
end
