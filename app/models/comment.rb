class Comment < ActiveRecord::Base

  attr_accessible :text, :state_id
  belongs_to :user
  belongs_to :state
end
