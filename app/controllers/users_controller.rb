class UsersController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "123"
  
  def index
    current_user
    @cars = Car.all.order(id: :asc)
  end

  def create
    @user = User.where(username: params[:username], password: params[:password]).first
    if @user
      session[:user_id] = @user[:id]
      cookies[:user_name] = @user[:username]
      flash[:notice] = 'You have successfully logged in.'
    else
      flash[:notice] = 'Invalid username & password.'
    end
    redirect_to users_path
  end

  def destroy
    session.delete(:user_id)
    redirect_to users_path
  end

end
