class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # In a real app, redirect to dashboard_url or something
      redirect_to root_url
    else
      render :new
    end

  end

private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
