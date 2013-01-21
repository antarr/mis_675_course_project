class MinstryMember < ActiveRecord::Base
  belongs_to :ministry
  belongs_to :member
  attr_accessible :position
end
