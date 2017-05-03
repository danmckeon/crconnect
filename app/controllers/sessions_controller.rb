class SessionsController < ApplicationController

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end

  def new
  end

  def create
    user = User.find_by(email: login_params[:email])
    if user && user.authenticate(login_params[:password])
      session[:user_id] = user.id
    end
    redirect_to admin_trials_pending_path
  end

  private
  def login_params
    params.require(:session).permit(:email, :password)
  end
end
