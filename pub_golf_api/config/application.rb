require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PubGolfApi
  class Application < Rails::Application
    config.to_prepare do
      DeviseController.respond_to :html, :json
    end
    config.middleware.insert_before Rack::Runtime, Rack::Cors do
      allow do
        origins '*'
        resource '*',
          headers: :any,
          methods: [:get, :put, :post, :patch, :delete, :options]
      end
    end
  end
end
