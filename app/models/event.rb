class Event < ActiveRecord::Base
  attr_accessible :actual_cost, :comments, :estimated_cost, :name
  has_many :event_members
  has_many :members, :through => :event_members
  has_many :budgets
end
