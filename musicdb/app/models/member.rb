class Member < ActiveRecord::Base
  belongs_to :group
  has_one :individual
end
