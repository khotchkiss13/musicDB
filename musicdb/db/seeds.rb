# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'rspotify'
require 'json'
require 'httparty'
require 'json'
require 'active_support/core_ext/hash'

individuals = [{name: 'Ed Sheeran', birth_date: '1991-02-17', primary_instrument: 'Guitar', vocals: 'Lead'},
              {name: 'James Hetfield', birth_date: '1963-08-03', primary_instrument: 'Rhythm Guitar', vocals: 'Lead'},
              {name: 'Kirk Hammet', birth_date: '1962-11-18', primary_instrument: 'Lead Guitar', vocals: 'Background'},
              {name: 'Lars Ulrich', birth_date: '1963-12-26', primary_instrument: 'Drums'},
              {name: 'Cliff Burton', birth_date: '1962-02-10', primary_instrument: 'Bass Guitar', vocals: 'Background'},
              {name: 'Jason Newsted', birth_date: '1963-03-04', primary_instrument: 'Bass Guitar', vocals: 'Background'},
              {name: 'Robert Trujillo', birth_date: '1964-08-23', primary_instrument: 'Bass Guitar', vocals: 'Background'},
              {name: 'Marhsall Mathers III', birth_date: '1972-10-17', primary_instrument: 'Keyboard', secondary_instrument: 'Sampler', vocals: 'Lead'},
              {name: 'Taylor Swift', birth_date: '1989-12-13', primary_instrument: 'Guitar', vocals: 'Lead'},
              {name: 'Christopher Maurice Brown', birth_date:'1989-05-05', vocals: 'Lead'},
              {name: 'Donald McKinley Glover', birth_date:'1983-09-25', primary_instrument: 'Vocals'},
              {name: 'Tahliah Debrett Barnett', birth_date: '1988-01-16', primary_instrument: 'Vocals', secondary_instrument:'Synthesizer', vocals: 'Lead'},
              {name: 'Francis Albert Sinatra', birth_date: '1915-12-12', primary_instrument: 'Vocals'},
              {name: 'Miley Cyrus', birth_date: '1992-11-23', primary_instrument: 'Vocals', secondary_instrument: 'Guitar', vocals: 'Lead'},
              {name: 'Adele Laurie Blue Adkins', birth_date: '1988-05-05', primary_instrument: nil, vocals: 'Lead'},
              {name: 'Beyonce Giselle Knowles', birth_date: '1981-09-04', primary_instrument: nil, vocals: 'Lead'},
              {name: 'Abel Makkonen Tesfaye', birth_date: '1990-02-16', primary_instrument: 'Keyboard', vocals: 'Lead'},
              {name: 'Onika Tanya Maraj', birth_date: '1982-12-08', primary_instrument: nil, vocals: 'Lead'},
              {name: 'Kanye Omari West', birth_date: '1977-06-08', primary_instrument: 'Keyboard', vocals: 'Lead'},
              {name: 'Stefani Joanne Angelina', birth_date: '1986-03-28', primary_instrument: 'Piano', vocals: 'Lead'},
              {name: 'Peter Gene Hernandez', birth_date: '1985-10-08', primary_instrument: 'Guitar', vocals: 'Lead'},
              {name: 'Mariah Carey', birth_date: '1969-03-27', primary_instrument: nil, vocals: 'Lead'},
              {name: 'Selena Marie Gomez', birth_date: '1992-07-22', primary_instrument: nil, vocals: 'Lead'},
              {name: 'Reginald Kenneth Dwight', birth_date: '1947-03-25', primary_instrument: 'Piano', vocals: 'Lead'},
              {name: 'Shawn Corey Carter', birth_date: '1969-12-04', primary_instrument: nil, vocals: 'Lead'},
              {name: 'Justin Randall Timberlake', birth_date: '1981-01-31', primary_instrument: 'Guitar', vocals: 'Lead'},
              {name: 'Elena Jane Goulding', birth_date: '1986-12-30', primary_instrument: nil, vocals: 'Lead'},
              {name: 'Shawn Peter Raul Mendes', birth_date: '1998-08-08', primary_instrument: 'Guitar', vocals: 'Lead'},
              {name: 'Ariana Grande-Butera', birth_date: '1993-06-26', primary_instrument: nil, vocals: ' Lead'},
              {name: 'Kendrick Lamar Duckworth', birth_date: '1987-06-17', primary_instrument: nil, vocals: 'Lead'},
              {name: 'Meghan Elizabeth Trainor', birth_date: '1993-12-22', primary_instrument: 'Piano', vocals: 'Lead'},
              {name: 'John Roger Stephens', birth_date: '1978-12-28', primary_instrument: 'Piano', vocals: 'Lead'},
              {name: 'Michael Steven Buble', birth_date: '1975-09-09', primary_instrument: nil, vocals: 'Lead'},
              {name: 'Demetria Devonne Lovato', birth_date: '1992-08-18', primary_instrument: 'Guitar', vocals: 'Lead'},
              {name: 'Samuel Frederick Smith', birth_date: '1992-05-19', primary_instrument: nil, vocals: 'Lead'},
              {name: 'Blake Tollison Shelton', birth_date: '1976-06-18', primary_instrument: 'Guitar', vocals: 'Lead'},
              {name: 'Carrie Marie Underwood', birth_date: '1983-03-10', primary_instrument: 'Guitar', vocals: 'Lead'},
              {name: 'Kelly Brianne Clarkson', birth_date: '1982-04-24', primary_instrument: nil, vocals: 'Guitar'},
              {name: 'Pharrell Lanscilo Williams', birth_date: '1973-04-05', primary_instrument: 'Keyboard', vocals: 'Lead'},
              {name: 'Celine Marie Claudette Dion', birth_date: '1968-03-30', primary_instrument: 'Piano', vocals: 'Lead'},
              {name: 'Madonna Louise Ciccone', birth_date: '1958-08-16', primary_instrument: 'Guitar', vocals: 'Lead'},
              {name: 'Britney Jean Spears', birth_date: '1981-12-02', primary_instrument: 'Piano', vocals: 'Lead'},
              {name: 'Lionel Brockman Richie, Jr.', birth_date: '1949-06-20', primary_instrument: 'Piano', vocals: 'Lead'},
              {name: 'Thomas Luther Bryan', birth_date: '1976-07-17', primary_instrument: 'Guitar', vocals: 'Lead'}


              ]

groups = [{name: 'Ed Sheeran', formation_date: '2005-01-01', disband_date: nil},
          {name: 'Metallica', formation_date: '1981-01-01', disband_date: nil},
          {name: 'Eminem', formation_date: '1992-01-01', disband_date: nil},
          {name: 'Taylor Swift', formation_date: '2006-10-26', disband_date: nil},
          {name: 'Chris Brown', formation_date: '2005-11-29', disband_date: nil},
          {name: 'Childish Gambino', formation_date: '2009-09-17', disband_date: nil},
          {name: 'FKA Twigs', formation_date: '2012-12-04', disband_date: nil},
          {name: 'Frank Sinatra', formation_date: '1939-01-01', disband_date: '1995-12-12'},
          {name: 'Miley Cyrus', formation_date: '2006-03-28', disband_date: nil},
          {name: 'Adele', formation_date: '2006-01-01', disband_date: nil},
          {name: 'Beyonce', formation_date: '1997-01-01', disband_date: nil},
          {name: 'The Weekend', formation_date: '2010-01-01', disband_date: nil},
          {name: 'Nicki Minaj', formation_date: '2007-01-01', disband_date: nil},
          {name: 'Kanye West', formation_date: '1996-01-01', disband_date: nil},
          {name: 'Lady Gaga', formation_date: '2001-01-01', disband_date: nil},
          {name: 'Bruno Mars', formation_date: '2004-01-01', disband_date: nil},
          {name: 'Mariah Carey', formation_date: '1988-01-01', disband_date: nil},
          {name: 'Selena Gomez', formation_date: '2002-01-01', disband_date: nil},
          {name: 'Elton John', formation_date: '1964-01-01', disband_date: nil},
          {name: 'Jay Z', formation_date: '1986-01-01', disband_date: nil},
          {name: 'Justin Timberlake', formation_date: '1992-01-01', disband_date: nil},
          {name: 'Ellie Goulding', formation_date: '2008-01-01', disband_date: nil},
          {name: 'Shawn Mendes', formation_date: '2013-01-01', disband_date: nil},
          {name: 'Ariana Grande', formation_date: '2008-01-01', disband_date: nil},
          {name: 'Kendrick Lamar', formation_date: '2003-01-01', disband_date: nil},
          {name: 'Meghan Trainor', formation_date: '2009-01-01', disband_date: nil},
          {name: 'John Legend', formation_date: '2000-01-01', disband_date: nil},
          {name: 'Michael Buble', formation_date: '1996-01-01', disband_date: nil},
          {name: 'Demi Lovato', formation_date: '2002-01-01', disband_date: nil},
          {name: 'Sam Smith', formation_date: '2007-01-01', disband_date: nil},
          {name: 'Blake Shelton', formation_date: '2001-01-01', disband_date: nil},
          {name: 'Carrie Underwood', formation_date: '2005-01-01', disband_date: nil},
          {name: 'Kelly Clarkson', formation_date: '2002-01-01', disband_date: nil},
          {name: 'Pharrell Williams', formation_date: '1992-01-01', disband_date: nil},
          {name: 'Celine Dion', formation_date: '1980-01-01', disband_date: nil},
          {name: 'Madonna', formation_date: '1979-01-01', disband_date: nil},
          {name: 'Britney Spears', formation_date: '1992-01-01', disband_date: nil},
          {name: 'Lionel Richie', formation_date: '1968-01-01', disband_date: nil},
          {name: 'Luke Bryan', formation_date: '2006-01-01', disband_date: nil}
         ]

individuals.each { |person| Individual.create!(person) }

members = {'Ed Sheeran'=> [{individual_id: Individual.where(name: 'Ed Sheeran').first.id, start_date: '2008-01-01', end_date: nil}],
           'Metallica'=> [{individual_id: Individual.where(name: 'James Hetfield').first.id, start_date: '1981-01-01', end_date: nil},
                         {individual_id: Individual.where(name: 'Kirk Hammet').first.id, start_date: '1983-01-01', end_date: nil},
                         {individual_id: Individual.where(name: 'Lars Ulrich').first.id, start_date: '1981-01-01', end_date: nil},
                         {individual_id: Individual.where(name: 'Cliff Burton').first.id, start_date: '1982-01-01', end_date: '1986-09-27'},
                         {individual_id: Individual.where(name: 'Jason Newsted').first.id, start_date: '1987-01-01', end_date: '2001-01-01'},
                         {individual_id: Individual.where(name: 'Robert Trujillo').first.id, start_date: '2003-01-01', end_date: nil}],
           'Eminem'=> [{individual_id: Individual.where(name: 'Marhsall Mathers III').first.id, start_date: '1992-01-01', end_date: nil}],
           'Taylor Swift' =>[{individual_id: Individual.where(name: 'Taylor Swift').first.id, start_date: '2006-10-26', end_date: nil}],
           'Chris Brown' =>[{individual_id: Individual.where(name: 'Christopher Maurice Brown').first.id, start_date: '2005-11-29', end_date: nil}],
           'Childish Gambino' =>[{individual_id: Individual.where(name: 'Donald McKinley Glover').first.id, start_date: '2009-09-17', end_date: nil}],
           'FKA Twigs' =>[{individual_id: Individual.where(name: 'Tahliah Debrett Barnett').first.id, start_date: '2012-12-04', end_date: nil}],
           'Frank Sinatra' =>[{individual_id: Individual.where(name: 'Francis Albert Sinatra').first.id, start_date: '1939-01-01', end_date: '1995-12-12'}],
           'Miley Cyrus' => [{individual_id: Individual.where(name: 'Miley Cyrus').first.id, start_date: '2006-03-28', end_date: nil}],
           'Adele'=> [{individual_id: Individual.where(name: 'Adele Laurie Blue Adkins').first.id, start_date: '2006-01-01', end_date: nil}],
            'Beyonce'=> [{individual_id: Individual.where(name: 'Beyonce Giselle Knowles').first.id, start_date: '1997-01-01', end_date: nil}],
            'The Weekend'=> [{individual_id: Individual.where(name: 'Abel Makkonen Tesfaye').first.id, start_date: '2010-01-01', end_date: nil}],
            'Nicki Minaj'=> [{individual_id: Individual.where(name: 'Onika Tanya Maraj').first.id, start_date: '2007-01-01', end_date: nil}],
            'Kanye West'=> [{individual_id: Individual.where(name: 'Kanye Omari West').first.id, start_date: '1996-01-01', end_date: nil}],
            'Lady Gaga'=> [{individual_id: Individual.where(name: 'Stefani Joanne Angelina').first.id, start_date: '2001-01-01', end_date: nil}],
            'Bruno Mars'=> [{individual_id: Individual.where(name: 'Peter Gene Hernandez').first.id, start_date: '2004-01-01', end_date: nil}],
            'Mariah Carey'=> [{individual_id: Individual.where(name: 'Mariah Carey').first.id, start_date: '1988-01-01', end_date: nil}],
            'Selena Gomez'=> [{individual_id: Individual.where(name: 'Selena Marie Gomez').first.id, start_date: '2002-01-01', end_date: nil}],
            'Elton John'=> [{individual_id: Individual.where(name: 'Reginald Kenneth Dwight').first.id, start_date: '1964-01-01', end_date: nil}],
            'Jay Z'=> [{individual_id: Individual.where(name: 'Shawn Corey Carter').first.id, start_date: '1986-01-01', end_date: nil}],
            'Justin Timberlake'=> [{individual_id: Individual.where(name: 'Justin Randall Timberlake').first.id, start_date: '1992-01-01', end_date: nil}],
            'Ellie Goulding'=> [{individual_id: Individual.where(name: 'Elena Jane Goulding').first.id, start_date: '2008-01-01', end_date: nil}],
            'Shawn Mendes'=> [{individual_id: Individual.where(name: 'Shawn Peter Raul Mendes').first.id, start_date: '2013-01-01', end_date: nil}],
            'Ariana Grande'=> [{individual_id: Individual.where(name: 'Ariana Grande-Butera').first.id, start_date: '2008-01-01', end_date: nil}],
            'Kendrick Lamar'=> [{individual_id: Individual.where(name: 'Kendrick Lamar Duckworth').first.id, start_date: '2003-01-01', end_date: nil}],
            'Meghan Trainor'=> [{individual_id: Individual.where(name: 'Meghan Elizabeth Trainor').first.id, start_date: '2009-01-01', end_date: nil}],
            'John Legend'=> [{individual_id: Individual.where(name: 'John Roger Stephens').first.id, start_date: '2000-01-01', end_date: nil}],
            'Michael Buble'=> [{individual_id: Individual.where(name: 'Michael Steven Buble').first.id, start_date: '1996-01-01', end_date: nil}],
            'Demi Lovato'=> [{individual_id: Individual.where(name: 'Demetria Devonne Lovato').first.id, start_date: '2002-01-01', end_date: nil}],
            'Sam Smith'=> [{individual_id: Individual.where(name: 'Samuel Frederick Smith').first.id, start_date: '2007-01-01', end_date: nil}],
            'Blake Shelton'=> [{individual_id: Individual.where(name: 'Blake Tollison Shelton').first.id, start_date: '2001-01-01', end_date: nil}],
            'Carrie Underwood'=> [{individual_id: Individual.where(name: 'Carrie Marie Underwood').first.id, start_date: '2005-01-01', end_date: nil}],
            'Kelly Clarkson'=> [{individual_id: Individual.where(name: 'Kelly Brianne Clarkson').first.id, start_date: '2002-01-01', end_date: nil}],
            'Pharrell Williams'=> [{individual_id: Individual.where(name: 'Pharrell Lanscilo Williams').first.id, start_date: '1992-01-01', end_date: nil}],
            'Celine Dion'=> [{individual_id: Individual.where(name: 'Celine Marie Claudette Dion').first.id, start_date: '1980-01-01', end_date: nil}],
            'Madonna'=> [{individual_id: Individual.where(name: 'Madonna Louise Ciccone').first.id, start_date: '1979-01-01', end_date: nil}],
            'Britney Spears'=> [{individual_id: Individual.where(name: 'Britney Jean Spears').first.id, start_date: '1992-01-01', end_date: nil}],
            'Lionel Richie'=> [{individual_id: Individual.where(name: 'Lionel Brockman Richie, Jr.').first.id, start_date: '1968-01-01', end_date: nil}],
            'Luke Bryan'=> [{individual_id: Individual.where(name: 'Thomas Luther Bryan').first.id, start_date: '2006-01-01', end_date: nil}]
         }

groups.each do |artist|
  group = Group.create!(artist)
  members[artist[:name]].each { |member| group.members.create!(member) }
  search = RSpotify::Artist.search(artist[:name]).first
  search.albums.each do |a| # for each of their albums
    release = group.releases.create!({:name => a.name, :date => a.release_date})
    a.tracks.each do |t| # for each of their tracks
      song = Song.create!({:name => t.name, :genre => a.genres, :length => t.duration_ms, :bpm => nil, :medium => nil})
      release.tracks.create!({:track_number => t.track_number, :song_id => song.id})
    end
  end
  page = 1
  while page < 3
    response = HTTParty.get("http://api.setlist.fm/rest/0.1/search/setlists",
    :query => {:artistName => group.name, :p => page})
    set = JSON.parse(Hash.from_xml(response.body).to_json)
    if set["setlists"]["setlist"].respond_to?(:each)
      set["setlists"]["setlist"].compact.each do |setlist|
        if setlist["artist"]["name"] == group.name && !setlist.compact["sets"].nil?
          show = group.shows.create({:name => (setlist["venue"]["city"]["name"].to_s + ", " + setlist["venue"]["city"]["state"].to_json), :venue => setlist["venue"]["name"], :date => setlist["eventDate"]})
          i = 1
          if setlist.compact["sets"]["set"].respond_to?(:each)
            setlist.compact["sets"]["set"].each do |set|
              if !set.respond_to?(:key)
                if set[1].respond_to?(:key)
                  set = {"song"=>[set[1]]}
                else
                  set = {"song"=>set[1]}
                end
              end
              if set["song"].respond_to?(:key)
                set["song"] = [set["song"]]
              end
              if (set["song"].respond_to?(:each))
                set["song"].each do |song|
                  db_songs = Song.where(name: song["name"])
                  actual_song = nil
                  db_songs.each do |db_song|
                    if db_song.artist.include?(group.name)
                      actual_song = db_song
                      break
                    end
                  end
                  if actual_song.nil?
                    actual_song = Song.create(name: song["name"])
                  end
                  show.tracks.create({:track_number => i, :song_id => actual_song.id})
                  i += 1
                end
              end
            end
          end
        end
      end
    end
    page += 1
  end
end
