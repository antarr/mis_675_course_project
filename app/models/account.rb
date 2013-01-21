class Account < ActiveRecord::Base
  attr_accessible :account_number, :balance, :comments, :name
  has_many :expenses
end
