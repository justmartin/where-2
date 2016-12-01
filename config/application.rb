require_relative 'boot'

require 'rails/all'
require "money"
require "eu_central_bank"

EU_BANK = EuCentralBank.new
Money.default_bank = EU_BANK
EU_BANK.update_rates

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
