require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Where the I18n library should search for translation files
# I18n.locale = :en
# I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]

# # Whitelist locales available for the application
# I18n.available_locales = [:en, :pt]

# # Set default locale to something other than :en
# I18n.default_locale = :en

# config.i18n.fallbacks = true

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# <link href="{{asset('theme/css/bootstrap.min.css')}}" rel="stylesheet">
#         <link href="{{asset('theme/css/font-awesome.min.css')}}" rel="stylesheet">
#         <link href="{{asset('theme/css/prettyPhoto.css')}}" rel="stylesheet">
#         <link href="{{asset('theme/css/price-range.css')}}" rel="stylesheet">
#         <link href="{{asset('theme/css/animate.css')}}" rel="stylesheet">
#         <link href="{{asset('theme/css/main.css')}}" rel="stylesheet">
#         <link href="{{asset('theme/css/responsive.css')}}" rel="stylesheet">
#         <link href="{{asset('theme/css/jquery-ui.css')}}" rel="stylesheet">
#         <link href="{{asset('theme/css/reset.css')}}" rel="stylesheet">
#         <link href="{{asset('theme/css/Cart.css')}}" rel="stylesheet">
#         <link href="{{asset('theme/css/wish-list.css')}}" rel="stylesheet">




module Eshopper
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
