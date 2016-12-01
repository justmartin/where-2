require_relative 'boot'

require 'rails/all'
require 'money'
require 'money/bank/google_currency'

Money.default_bank = Money::Bank::GoogleCurrency.new


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Where2
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
