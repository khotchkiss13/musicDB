class Member < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :group
  belongs_to :individual

  def name
    self.individual.name
  end

  def birthday
    self.indivdual.birth_date
  end

  def primary_instrument
    self.indivdual.primary_instrument
  end

  def secondary_instrument
    self.indivdual.secondary_instrument
  end

  def vocals
    self.individual.vocals
  end

  def ind
    self.individual.id
  end
end
