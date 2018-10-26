module Jauth
  class Engine < ::Rails::Engine
    isolate_namespace Jauth
    config.generators.api_only = true

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot, :dir => 'spec/factories'
    end
  end
end
