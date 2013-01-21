class EventMember < ActiveRecord::Base
  belongs_to :event
  belongs_to :member
  # attr_accessible :title, :body
end
