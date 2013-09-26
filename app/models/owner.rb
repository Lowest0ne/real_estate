class Owner < ActiveRecord::Base

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email

  has_one :building, dependent: :nullify, inverse_of: :owner

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.without_buildings
    Owner.all.map{|o|o.full_name}
  end

end
