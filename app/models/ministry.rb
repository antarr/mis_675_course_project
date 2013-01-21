class Ministry < ActiveRecord::Base
  attr_accessible :balance_avaialable, :dues_collected, :meeting_day, :meeting_time, :name
  has_many :minstry_members
  has_many :members, :through => :minstry_members
end
