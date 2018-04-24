class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by username: params[:username]
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
    end
    redirect_to root_path
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
