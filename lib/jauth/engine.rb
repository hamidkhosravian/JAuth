module Jauth
  class Engine < ::Rails::Engine
    isolate_namespace Jauth
    config.generators.api_only = true
    config.autoload_paths += %W(lib/errors)

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot, :dir => 'spec/factories'
    end

    config.before_initialize do
      config.i18n.load_path += %W["config/locales/*.yml"]
    end
  end
end
