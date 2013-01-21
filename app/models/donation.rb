class Donation < ActiveRecord::Base
  belongs_to :member
  attr_accessible :amount, :date_given, :donation_type
end
