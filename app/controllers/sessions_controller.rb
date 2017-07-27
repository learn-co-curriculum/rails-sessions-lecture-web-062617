class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    # binding.pry

    if user && user.authenticate(params[:user][:password])
      session[:current_user_id] = user.id
      redirect_to students_path
    else
      flash[:message] = 'We could not find a user with that username in our records or you entered the password incorrectly'
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
