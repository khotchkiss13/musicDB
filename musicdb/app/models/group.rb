class Group < ActiveRecord::Base
  has_many :members
  has_many :releases
  has_many :tracks, through: :releases
  has_many :shows
end
