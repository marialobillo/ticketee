class Admin::PermissionsController < Admin::BaseController

  before_action :set_user

  def index
    @ability = ability.new(@user)
    @projects = Project.all
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set
    @user.permissions.clear
    params[:permissions].each do |id, permissions|
      project = Project.find(id)
      permissions.each do |permission, checked|
        Permission.create!(user: @user,
                            thing: project,
                            action: permission)
      end
    end
  end

end
