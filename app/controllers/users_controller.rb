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
  	@user = User.find(params[:id])
    if @user.udpate
      redirect_to user_path(@user.id), notice: '会員情報を編集しました'
    else
      flash.now[:alert] = '会員情報の追加に失敗しました'
      render :edit
    end
  end
  private
  def user_params
    params.require(:name, :name_kana, :postal_code, :address, :phone_number, :email, :encrypted_password, :deleted_user)
  end
end
