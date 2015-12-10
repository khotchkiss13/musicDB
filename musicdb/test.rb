require './setlistfm.rb'
require 'net/https'
require 'uri'
require 'json'

include Fm
include Setlist
include Api
include Model

file = File.read('sheeran_setlists.json')
set = JSON.parse(file)
puts set["setlists"]["setlist"][0]["sets"]["set"][0]["song"]
