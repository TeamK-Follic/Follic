class UsersController < ApplicationController
  def about
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def udpate
  	user = User.find(params[:id])
    user.udpate
    redirect_to users_show_path
  end
  private
  def user_params
    params.require(:name, :name_kana, :postal_code, :address, :phone_number, :email, :encrypted_password, :deleted_user)
  end
end
