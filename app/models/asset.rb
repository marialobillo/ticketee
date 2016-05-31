class Asset < ActiveRecord::Base
  mount_uploader :asset, AssetUploader

  before_save :update_content_type
end
