class Project < ActiveRecord::Base

  has_many :tickets, dependent: :delete_all
  validates :name, presence: true

  has_many :permissions, as: :thing
  scope :for, ->(user) do
    user.admin? ? Project.all : Project.viewable_by(user)
  end
end
