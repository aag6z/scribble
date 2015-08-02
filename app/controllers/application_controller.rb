class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate
  before_filter :get_user

  def get_user
    if session[:user]
      @user = User.find(session[:user]["id"])
    end
  end
  
  private
  def authenticate
    if !session[:user]
      redirect_to "/sign_in"
    end
  end
end
