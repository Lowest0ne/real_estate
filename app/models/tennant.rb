class Tennant < ActiveRecord::Base

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email

  belongs_to :building, inverse_of: :tennants

  def full_name
    "#{first_name} #{last_name}"
  end

end
