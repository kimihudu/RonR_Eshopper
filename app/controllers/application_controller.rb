class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :warning, :danger, :info
  # before_action :set_locale

  # def set_locale
  #   I18n.locale = extract_locale_from_tld || I18n.default_locale
  # end
end
