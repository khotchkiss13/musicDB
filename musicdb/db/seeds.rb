# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'rspotify'
require 'json'
require 'net/https'
require 'uri'
individuals = [{name: 'Ed Sheeran', birth_date: '1991-02-17', primary_instrument: 'Guitar', vocals: 'Lead'},
              {name: 'James Hetfield', birth_date: '1963-08-03', primary_instrument: 'Rhythm Guitar', vocals: 'Lead'},
              {name: 'Kirk Hammet', birth_date: '1962-11-18', primary_instrument: 'Lead Guitar', vocals: 'Background'},
              {name: 'Lars Ulrich', birth_date: '1963-12-26', primary_instrument: 'Drums'},
              {name: 'Cliff Burton', birth_date: '1962-02-10', primary_instrument: 'Bass Guitar', vocals: 'Background'},
              {name: 'Jason Newsted', birth_date: '1963-03-04', primary_instrument: 'Bass Guitar', vocals: 'Background'},
              {name: 'Robert Trujillo', birth_date: '1964-08-23', primary_instrument: 'Bass Guitar', vocals: 'Background'},
              {name: 'Marhsall Mathews III', birth_date: '1972-10-17', primary_instrument: 'Keyboard', secondary_instrument: 'Sampler', vocals: 'Lead'},
              {name: 'Taylor Swift', birth_date: '1989-12-13', primary_instrument: 'Guitar', vocals: 'Lead'},
              {name: 'Christopher Maurice Brown', birth_date:'1989-05-05', vocals: 'Lead'},
              {name: 'Donald McKinley Glover', birth_date:'1983-09-25', primary_instrument: 'Vocals'},
              {name: 'Tahliah Debrett Barnett', birth_date: '1988-01-16', primary_instrument: 'Vocals', secondary_instrument:'Synthesizer', vocals: 'Lead'},
              {name: 'Francis Albert Sinatra', birth_date: '1915-12-12', primary_instrument: 'Vocals'}

              ]
groups = [{name: 'Ed Sheeran', formation_date: '2005-01-01', disband_date: nil},
          {name: 'Metallica', formation_date: '1981-01-01', disband_date: nil},
          {name: 'Eminem', formation_date: '1992-01-01', disband_date: nil},
          {name: 'Taylor Swift', formation_date: '2006-10-26', disband_date: nil}
          {name: 'Chris Brown', formation_date: '2005-11-29', disband_date: nil},
          {name: 'Childish Gambino', formation_date: '2009-09-17', disband_date: nil}
          {name: 'FKA Twigs', formation_date: '2012-12-04', disband_date: nil},
          {name: 'Frank Sinatra', formation_date: '1939-01-01', disband_date: '1995-12-12'}
         ]

individuals.each { |person| Individual.create!(person) }

members = {'Ed Sheeran'=> [{individual_id: Individual.where(name: 'Ed Sheeran').first.id, start_date: '2008-01-01', end_date: nil}],
           'Metallica'=> [{individual_id: Individual.where(name: 'James Hetfield').first.id, start_date: '1981-01-01', end_date: nil},
                         {individual_id: Individual.where(name: 'Kirk Hammet').first.id, start_date: '1983-01-01', end_date: nil},
                         {individual_id: Individual.where(name: 'Lars Ulrich').first.id, start_date: '1981-01-01', end_date: nil},
                         {individual_id: Individual.where(name: 'Cliff Burton').first.id, start_date: '1982-01-01', end_date: '1986-09-27'},
                         {individual_id: Individual.where(name: 'Jason Newsted').first.id, start_date: '1987-01-01', end_date: '2001-01-01'},
                         {individual_id: Individual.where(name: 'Robert Trujillo').first.id, start_date: '2003-01-01', end_date: nil}],
           'Eminem'=> [{individual_id: Individual.where(name: 'Marhsall Mathews III').first.id, start_date: '1992-01-01', end_date: nil}],
           'Taylor Swift' =>[{individual_id: Individual.where(name: 'Taylor Swift').first.id, start_date: '2006-10-26', end_date: nil}],
           'Chris Brown' =>[{individual_id: Individual.where(name: 'Christopher Maurice Brown').first.id, start_date: '2005-11-29', end_date: nil}],
           'Childish Gambino' =>[{individual_id: Individual.where(name: 'Donald McKinley Glover').first.id, start_date: '2009-09-17', end_date: nil}],
           'FKA Twigs' =>[{individual_id: Individual.where(name: 'Tahliah Debrett Barnett').first.id, start_date: '2012-12-04', end_date: nil}],
           'Frank Sinatra' =>[{individual_id: Individual.where(name: 'Francis Albert Sinatra').first.id, start_date: '1939-01-01', end_date: '1995-12-12'}]
         }

groups.each do |artist|
  group = Group.create!(artist)
  members[artist[:name]].each { |member| group.members.create!(member) }
  search = RSpotify::Artist.search(artist[:name]).first
  search.albums.each do |a|
    release = Release.create!({:name => a.name, :date => a.release_date})
    a.tracks.each do |t|
      song = Song.create!({:name => t.name, :genre => a.genres, :length => t.duration_ms, :bpm => nil, :medium => nil})
      release.tracks.create!({:track_number => t.track_number, :song_id => song.id})
    end
  end
end

groups.each do |artist|
  artist.name
