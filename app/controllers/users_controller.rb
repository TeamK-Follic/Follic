class UsersController < ApplicationController
  # before_action :authenticate_manager!, only: [:index]
  # before_action :authenticate_user!
  def about
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @search = User.ransack(params[:q])
    @search_users = @search.result.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
    user.udpate
    redirect_to users_show_path
  end
  private
  def user_params
    params.require(:name, :name_kana, :postal_code, :address, :phone_number, :email, :encrypted_password, :deleted_user)
  end
end
