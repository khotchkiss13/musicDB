class Group < ActiveRecord::Base
  validates :name, presence: true
  has_many :members
  has_many :releases
  has_many :tracks, through: :releases
  has_many :shows
  def labels
  	labels = []
  	self.releases.each { |release| labels << release.record_label }
  	labels.uniq.compact
  end

end
