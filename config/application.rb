require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Babilonia
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
   # config.cache_store = :redis_store, 'redis://localhost:6379/0/cache'
    config.load_defaults 5.1
    config.autoload_paths << Rails.root.join('app/scrapings')
    config.autoload_paths << Rails.root.join('app/services')

    # Redis config
    config.cache_store = :redis_store, 'redis://redis:6379/0'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
