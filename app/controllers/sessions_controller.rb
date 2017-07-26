class SessionsController < ApplicationController
  def new
  end

  def create
    # binding.pry
    user = User.find_by(username: params[:username])

    if user
      session[:current_user_id] = user.id
      redirect_to students_path
    else
      flash[:dog] = 'We could not find a user with tha username in our records'
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
