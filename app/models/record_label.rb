class RecordLabel < ActiveRecord::Base
  validates :name, presence: true
  has_many :releases
  has_many :groups, through: :releases
end
