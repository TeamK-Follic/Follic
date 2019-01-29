class UsersController < ApplicationController
  # before_action :authenticate_manager!, only: [:index]
  # before_action :authenticate_user!, only: [:show, :index, :edit, :update]
  # before_action :ensure_login_user, only: [:show, :edit, :update]

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
    if manager_signed_in?
    	@user = User.find(params[:id])
    else user_signed_in?
      @user = User.find(current_user.id)
    end

    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: '会員情報を編集しました'
    else
      flash.now[:alert] = '会員情報の追加に失敗しました'
      render :edit
    end
  end

  def unsubscribe
    user = User.find(current_user.id)
    user.deleted_user = 1
    user.save
    reset_session
    redirect_to items_path, alert: '退会しました。'
  end

  def ensure_login_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to items_path, alert: '許可されていないリクエストです。'
    end
  end

  private
  def user_params
    params.require(:name, :name_kana, :postal_code, :address, :phone_number, :email)
  end
end
