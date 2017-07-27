class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method  :current_user, :logged_in?

  def authorize_user
    if !logged_in?
      flash[:message] = 'You must be logged in to see that page'
      redirect_to login_path
    end
  end

  def current_user

    @current_user ||= User.find_by(id: session[:current_user_id])
    # if @current_user
    #   @current_user
    # else
    #   @current_user = User.find_by(id: session[:current_user_id])
    # end
  end

  def logged_in?
    !!current_user
  end
end
