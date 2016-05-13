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

end
