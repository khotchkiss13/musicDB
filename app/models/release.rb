class Release < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :record_label
  belongs_to :group
  has_many :tracks
end
