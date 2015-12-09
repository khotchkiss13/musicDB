class Track < ActiveRecord::Base
  belongs_to :song
  belongs_to :release
  has_and_belongs_to_many :shows, :join_table => :set_lists

  def name
    self.song.name
  def
    t.string   "genre"
    t.integer  "length"
    t.integer  "bpm"
    t.string   "medium"
  def genre
    self.song.genre
  end

  def length
    self.song.length
  end

  def bpm
    self.song.bpm
  end

  def medium
    self.song.medium
  end
end
