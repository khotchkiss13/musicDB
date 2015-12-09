class Song < ActiveRecord::Base
  has_many :tracks
  has_and_belongs_to_many :writers, class_name: "Individual",  :join_table => :written_by
  has_and_belongs_to_many :producers, class_name: "Individual",  :join_table => :produced_by
end
