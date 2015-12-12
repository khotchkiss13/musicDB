# {name: '', birth_date: 'YYYY-MM-DD', primary_instrument: '', vocals: ''},

individuals = [{name: 'Ed Sheeran', birth_date: '1991-02-17', primary_instrument: 'Guitar', vocals: 'Lead'},
              {name: 'Justin Bieber', birth_date: '1994-03-01', primary_instrument: 'NULL', vocals: 'Lead'},
              {name: 'James Bay', birth_date: '1990-09-04', primary_instrument: 'Guitar', vocals: 'Lead'},
              {name: 'James Hetfield', birth_date: '1963-08-03', primary_instrument: 'Rhythm Guitar', vocals: 'Lead'},
              {name: 'Kirk Hammet', birth_date: '1962-11-18', primary_instrument: 'Lead Guitar', vocals: 'Background'},
              {name: 'Lars Ulrich', birth_date: '1963-12-26', primary_instrument: 'Drums'},
              {name: 'Cliff Burton', birth_date: '1962-02-10', primary_instrument: 'Bass Guitar', vocals: 'Background'},
              {name: 'Jason Newsted', birth_date: '1963-03-04', primary_instrument: 'Bass Guitar', vocals: 'Background'},
              {name: 'Robert Trujillo', birth_date: '1964-08-23', primary_instrument: 'Bass Guitar', vocals: 'Background'},
              {name: 'Marhsall Mathews III', birth_date: '1972-10-17', primary_instrument: 'Keyboard', secondary_instrument: 'Sampler', vocals: 'Lead'}
              ]

# {name: '', formation_date: 'YYYY-01-01', disband_date: nil},              
groups = [{name: 'Ed Sheeran', formation_date: '2005-01-01', disband_date: nil},
          {name: 'Justin Bieber', formation_date: '2009-01-01', disband_date: nil},
          {name: 'James Bay', formation_date: '2014-01-01', disband_date: nil},
          {name: 'Metallica', formation_date: '1981-01-01', disband_date: nil},
          {name: 'Eminem', formation_date: '1992-01-01', disband_date: nil}
         ]

# 'name'=> [{individual_id: Individual.where(name: 'name').first.id, start_date: 'YYYY-01-01', end_date: nil}],
individuals.each { |person| Individual.create!(person) }

members = {'Ed Sheeran'=> [{individual_id: Individual.where(name: 'Ed Sheeran').first.id, start_date: '2008-01-01', end_date: nil}],
           'Justin Bieber'=> [{individual_id: Individual.where(name: 'Justin Bieber').first.id, start_date: '2009-01-01', end_date: nil}],
           'James Bay'=> [{individual_id: Individual.where(name: 'James Bay').first.id, start_date: '2014-01-01', end_date: nil}],
           'Metallica'=> [{individual_id: Individual.where(name: 'James Hetfield').first.id, start_date: '1981-01-01', end_date: nil},
                         {individual_id: Individual.where(name: 'Kirk Hammet').first.id, start_date: '1983-01-01', end_date: nil},
                         {individual_id: Individual.where(name: 'Lars Ulrich').first.id, start_date: '1981-01-01', end_date: nil},
                         {individual_id: Individual.where(name: 'Cliff Burton').first.id, start_date: '1982-01-01', end_date: '1986-09-27'},
                         {individual_id: Individual.where(name: 'Jason Newsted').first.id, start_date: '1987-01-01', end_date: '2001-01-01'},
                         {individual_id: Individual.where(name: 'Robert Trujillo').first.id, start_date: '2003-01-01', end_date: nil}],
           'Eminem'=> [{individual_id: Individual.where(name: 'Marhsall Mathews III').first.id, start_date: '1992-01-01', end_date: nil}]
           

         }