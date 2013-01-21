class Budget < ActiveRecord::Base
  belongs_to :account
  belongs_to :event
  attr_accessible :allocated_amount, :end_date, :limit, :name, :start_date
  has_many :budget_items

  def amount_remaining
    r = self.limit - self.allocated_amount
  end
end
