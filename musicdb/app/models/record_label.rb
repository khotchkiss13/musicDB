class RecordLabel < ActiveRecord::Base
  has_many :releases
  has_many :groups, through: releases
end
