class Release < ActiveRecord::Base
  belongs_to :record_label
  belongs_to :group
  has_many :tracks
end
