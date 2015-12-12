class Individual < ActiveRecord::Base
  validates :name, presence: true
  has_many :members
  has_and_belongs_to_many :written_songs, class_name: "Song",  :join_table => :written_by
  has_and_belongs_to_many :produced_songs, class_name: "Song",  :join_table => :produced_by
end
