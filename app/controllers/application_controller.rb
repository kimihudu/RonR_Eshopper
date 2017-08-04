class ApplicationController < ActionController::Base
  # before_action :authenticate_user!, :except => [:index,:show]
  # before_action :ensure_admin!

  # protect_from_forgery with: :null_session
  add_flash_types :success, :warning, :danger, :info

  # before_action :set_locale

  # def set_locale
  #   I18n.locale = extract_locale_from_tld || I18n.default_locale
  # end

  #  before_filter :configure_permitted_parameters, if: :devise_controller?

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name,:last_name,:profile_name,:email, :password) }
  #   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name,:last_name,:profile_name,:email, :password) }
  # end
  def ensure_admin!
    if current_user != nil && current_user.admin?

      redirect_to admin_products_path

      false
    end
  end
end
