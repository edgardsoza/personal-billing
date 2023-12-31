class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to log_in_path
    else
      flash.now[:error] = 'Please enter valid information.'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
