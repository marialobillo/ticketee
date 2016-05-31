class Asset < ActiveRecord::Base
  mount_uploader :asset, AssetUploader

  before_save :update_content_type

  private

    def update_content_type
      if asset.present? && asset_changed?
        self.content_tpye = asset.file.content_type
      end
    end
end
