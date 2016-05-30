class FilesController < ApplicationController
  before_filter :require_signin!

  def show
    asset = Asset.find(params[:id])
    send_file asset.asset.path,
        filename: asset.asset_identifier,
        content_type: asset.content_type
  end
end
