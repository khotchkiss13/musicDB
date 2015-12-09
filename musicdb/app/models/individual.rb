class Individual < ActiveRecord::Base
  belongs_to :member
  has_and_belongs_to_many :written_songs, class_name: "Song",  :join_table => :written_by
  has_and_belongs_to_many :produced_songs, class_name: "Song",  :join_table => :produced_by
end
