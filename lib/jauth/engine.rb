module Jauth
  class Engine < ::Rails::Engine
    isolate_namespace Jauth
    config.generators.api_only = true
  end
end
