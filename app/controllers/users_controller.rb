class UsersController < ApplicationController
  def about
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def udpate
  	user = User.find(params[:id])
    user.udpate
    redirect_to 
  end
  private
  def user_params
    
  end
end
