class UsersController < ApplicationController
  before_action :authenticate_manager!, only: [:index]
  before_action :user_or_manager_signed_in?, only: [:show, :edit, :update, :unsubscribe]
  before_action :ensure_login_user, only: [:show, :edit, :update, :unsubscribe]

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
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: '会員情報を編集しました'
    else
      flash.now[:alert] = '会員情報の追加に失敗しました'
      render :edit
    end
  end

  def unsubscribe
    user = User.find(params[:id])
    user.deleted_user = 1
    user.save
    if user_signed_in?
      reset_session
      redirect_to items_path, alert: '退会しました。'
    elsif manager_signed_in?
      redirect_to users_path, notice: '会員の退会処理が完了しました'
    end
  end

  def ensure_login_user
    if manager_signed_in?
    else
      @user = User.find(params[:id])
      if @user.id != current_user.id
        redirect_to items_path, alert: '許可されていないリクエストです。'
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :name_kana, :postal_code, :address, :phone_number, :email)
  end
end
