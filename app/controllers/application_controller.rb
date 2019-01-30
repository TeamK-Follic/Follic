class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def user_or_manager_signed_in?
    if user_signed_in?
    elsif manager_signed_in?
    else
      redirect_to new_user_session_path, alert: 'ログインしてください。'
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :postal_code, :address, :phone_number])
  end
end
