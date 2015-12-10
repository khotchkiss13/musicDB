require './setlistfm.rb'
require 'net/https'
require 'uri'
require 'json'

include Fm
include Setlist
include Api
include Model


url = URI.parse("http://api.setlist.fm/rest/0.1/search/setlists?artistName=%22James%20Bay%22")
request = Net::HTTP::Get.new(url.request_uri)

http = Net::HTTP.new(url.host, url.port)
res = http.start do |ht|
  ht.request(request)
  # puts "hello"
end

# puts res.body.from_json
# set = Setlist.new
# set = res.body.from_json
result = ::Setlist.from_json(JSON.parse(res.body))

result.list
# result.artist



# **************************************************************

# require './setlistfm.rb'
# require 'net/https'
# require 'uri'

# include Fm
# include Setlist
# include Api
# include Model

# url = URI.parse("http://api.setlist.fm/rest/0.1/artist/b8a7c51f-362c-4dcb-a259-bc6e0095f0a6/setlists.json")
# puts(url)
# request = Net::HTTP::Get.new(url.request_uri)
# puts(request)
# puts(url.host)
# puts(url.port)
# http = Net::HTTP.new(url.host, url.port)
# # # //set up additional http stuff...
# res = http.start do |ht|
#   ht.request(request)
#   puts "hello"
# end
# puts(res)

# @result = ::Setlist.from_json(JSON.parse(res.body))

# **************************************************************



# Dir["~/Desktop/Setlist/*.rb"].each {|file| require file }


# require 'net/https'
# require 'uri'

# url = URI.parse("http://api.setlist.fm/rest/0.1/artist/b8a7c51f-362c-4dcb-a259-bc6e0095f0a6/setlists.json")
# request = Net::HTTP::Get.new(url.request_uri)

# http = Net::HTTP.new(url.host, url.port)
# # //set up additional http stuff...
# res = http.start do |ht|
#   ht.request(request)
# end

# result = Setlist.from_json(JSON.parse(res.body))
# puts result


# require './setlistfm.rb'
# include Setlist
# include "selistfm.rb"
# import 'setlistfm.rb'



# file = File.read('sheeran_setlists.json')
# puts file
# set = ::Setlist.new()

# # result = ::Setlist.from_json(JSON.parse(file.to_jaxb_json_hash))
# puts @result.artist


# file = File.read('sheeran_setlists.json')
# data_hash = JSON.parse(file)

# puts data_hash

# sheeran_set.init_jaxb_json_hash(file)



# json_hash = file.to_jaxb_json_hash
# json_hash.init_jaxb_json_hash.from_json
# puts json_hash
# data_hash = JSON.parse(file)

# puts data_hash


# require 'net/https'
# require 'uri'
# # ...

# # read a resource from a REST url
# url = URI.parse("...")
# request = Net::HTTP::Get.new(url.request_uri)

# http = Net::HTTP.new(url.host, url.port)
# # set up additional http stuff...
# res = http.start do |ht|
#   ht.request(request)
# end


# http://api.setlist.fm/rest/0.1/search/setlists.json?artistName=Prince.
# http://api.setlist.fm/rest/0.1/artist/{mbid}
# http://api.setlist.fm/rest/0.1/artist/b8a7c51f-362c-4dcb-a259-bc6e0095f0a6/setlists.json
# b8a7c51f-362c-4dcb-a259-bc6e0095f0a6