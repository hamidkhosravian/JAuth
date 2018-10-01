$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "jauth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "jauth"
  s.version     = Jauth::VERSION
  s.authors     = ["hamid"]
  s.email       = [""]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Jauth."
  s.description = "TODO: Description of Jauth."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.1"

  s.add_development_dependency "pg"
end
