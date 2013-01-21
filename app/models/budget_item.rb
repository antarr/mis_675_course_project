class BudgetItem < ActiveRecord::Base
  belongs_to :budget
  attr_accessible :cost_per, :quantity, :title

  def total_cost
    t =  self.cost_per * self.quantity
  end
end
