class Show < ActiveRecord::Base
  validates :name, presence: true
  has_and_belongs_to_many :tracks, :join_table => :set_lists
  belongs_to :group
end
