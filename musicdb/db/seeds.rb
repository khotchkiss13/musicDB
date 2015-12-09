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
    Group.create!({:name => t[0], :formation_date => null, :disband_date => null})
  else
    Individuals.create!({:name => t[0], :formation_date => null, :disband_date => null})
  end
end

arctic_monkeys.albums.each do |a|
  a.tracks.each do |t|
    Song.create!({:release_id => null, :name => t.name, :genre => a.genres, :length => duration_ms, :bpm => null, :medium => null})
    Track.create!(:track_number => t.track_number, :song_id => null})
  end
end

