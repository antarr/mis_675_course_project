class Vendor < ActiveRecord::Base
  attr_accessible :address, :city, :name, :state, :zipcode, :phone_number, :email
  has_many :expenses

  def full_name
    self.name
  end
end
