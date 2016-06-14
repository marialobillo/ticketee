class Comment < ActiveRecord::Base

  after_create :set_ticket_state

  attr_accessible :text, :state_id
  belongs_to :user
  belongs_to :state
end
