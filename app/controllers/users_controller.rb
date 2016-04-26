class UsersController < ApplicationController

  scope :by_name, -> { order(:name) }

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id 
      flash[:notice] = "You have signed up succesfully."
      redirect_to projects_path
    else
      render :new
    end
  end

  def show
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
