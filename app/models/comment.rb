class Comment < ActiveRecord::Base

  after_create :set_ticket_state

  validates :text, :presence => true
  belongs_to :user
  belongs_to :state
  belongs_to :ticket

  delegate :project, to: => ticket
end
