class Admin::UsersController < Admin::BaseController
  def index
    @users = User.order(:email)
  end
end
