class Admin::UsersController < Admin::BaseController


  def index
    @users = User.order(:email)
  end

  def new
    @user = User.new
  end
end
