class Member < ActiveRecord::Base
  attr_accessible :address, :city, :email, :first_name, :last_name, :phone_number, :state, :zipcode

  has_many :event_members
  has_many :events , :through => :event_members
  has_many :minstry_members
  has_many :ministries, :through => :minstry_members

  def full_name
    return self.first_name + ' ' + self.last_name
  end
end
