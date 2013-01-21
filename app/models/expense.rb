class Expense < ActiveRecord::Base
  belongs_to :account
  belongs_to :vendor
  attr_accessible :amount, :description, :name, :date_of
  paginates_per 20
end
