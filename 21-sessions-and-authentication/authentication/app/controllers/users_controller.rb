class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = 'Account successfully created!'

      # In a real app, redirect to dashboard_url or something
      redirect_to root_url
    else
      # Use .now when no extra request follows!
      flash.now[:error] = 'Sorry, try again!'
      render :new
    end

  end

private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
