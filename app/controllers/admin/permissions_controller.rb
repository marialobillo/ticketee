class Admin::PermissionsController < Admin::BaseController


  def check_permission_box(permission, object)
    check "permissions_#{object.id}_#{permission}"
  end
end
