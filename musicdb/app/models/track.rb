class Track < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :song
  belongs_to :release
  has_and_belongs_to_many :shows, :join_table => :set_lists

  def name
    if self.song.nil?
      return nil.to_s
    end
    self.song.name
  end

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
