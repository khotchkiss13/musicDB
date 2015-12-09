class Member < ActiveRecord::Base
  belongs_to :group
  has_one :individual

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
end
