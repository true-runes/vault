require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'rails/test_unit/railtie'

Bundler.require(*Rails.groups)

module Vault
  class Application < Rails::Application
    config.load_defaults 7.0
    config.api_only = true
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja

    config.generators do |generator|
      generator.test_framework(
        :rspec,
        fixtures: false, # データの性質上、インポートした実データを用いるので原則不要
        controller_specs: true,
        helper_specs: false,
        routing_specs: false
      )

      # データの性質上、インポートした実データを用いるので原則不要
      # generator.fixture_replacement :factory_bot, dir: 'spec/factories'
    end
  end
end
