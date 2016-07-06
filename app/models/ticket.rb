class Ticket < ActiveRecord::Base

  mount_uploader :asset, AssetUploader

  belongs_to :project
  belongs_to :user
  belongs_to :state

  validates :title, presence: true
  validates :description, presence: true,
                          length: { minimum: 10 }

  has_many :assets
  accepts_nested_attributes_for :assets
  has_many :comments
  attr_accessor :tag_names

  def tag_names
    @tag_names
  end

  
end
