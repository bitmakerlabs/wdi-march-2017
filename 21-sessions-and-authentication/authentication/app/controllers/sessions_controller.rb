class SessionsController < ApplicationController
  def new
  end

  def create
    u = User.find_by(email: session_params[:email])

    if u && u.authenticate(session_params[:password])
      flash[:notice] = 'Successfully logged in!'

      # Remember the logged in user
      session[:user_id] = u.id

      # In a real app, redirect to dashboard_url or something
      redirect_to root_url
    else
      flash.now[:alert] = 'Try again!'
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You're logged out!"
    redirect_to root_url
  end

private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end

# These 3 hashes are always available to you in a Rails controller
# params
# flash
# session
