# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'rspotify'
test = [['Arctic Monkeys', 'group'], ['Ed Sheeran', 'indiv']]
arctic_monkeys = RSpotify::Artist.search(test[0][0]).first
ed_sheeran = RSpotify::Artist.search(test[1][0]).first

test.each do |t|
  if t[1] == 'group'
    Group.create!({:name => t[0], :formation_date => nil, :disband_date => nil})
  else
    Individual.create!({:name => t[0]})
  end
end

arctic_monkeys.albums.each do |a|
  album = Release.create!({:name => a.name, :date => a.release_date})
  a.tracks.each do |t|
    song = Song.create!({:release_id => nil, :name => t.name, :genre => a.genres, :length => t.duration_ms, :bpm => nil, :medium => nil})
    Track.create!({:track_number => t.track_number, :song_id => song.id})
  end
end
