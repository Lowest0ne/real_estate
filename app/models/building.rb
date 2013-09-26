class Building < ActiveRecord::Base

  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :postal_code


  def self.valid_states
    ['MA']
  end
  validates_inclusion_of :state, in: Building.valid_states

  validates_numericality_of :postal_code
  validates_length_of :postal_code, is: 5

end
