class Song < ActiveRecord::Base
  validates :name, presence: true
  has_many :tracks
  has_and_belongs_to_many :writers, class_name: "Individual",  :join_table => :written_by
  has_and_belongs_to_many :producers, class_name: "Individual",  :join_table => :produced_by

  def artist
    self.tracks.each do |track|
      if !track.release.nil? && !track.release.group.nil?
        return track.release.group.name
      end
    end
    return "None"
  end

  def song_length
    t = self.length * 0.001
    if t < 3600
      return Time.at(t).utc.strftime("%M:%S")
    end
    return Time.at(t).utc.strftime("%H:%M:%S")
  end

end
