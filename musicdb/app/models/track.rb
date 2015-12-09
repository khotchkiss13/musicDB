class Track < ActiveRecord::Base
  belongs_to :song
  belongs_to :release
  has_and_belongs_to_many :shows, :join_table => :set_lists
end
