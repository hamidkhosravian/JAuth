$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "jauth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "jauth"
  s.version     = Jauth::VERSION
  s.authors     = ["hamid"]
  s.email       = ["hamid.kh.1991@gmail.com"]
  s.homepage    = ""
  s.summary     = "JWT authentication for rails."
  s.description = "JWT authentication for rails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.1"

  s.add_development_dependency "pg"
  s.add_development_dependency "jbuilder"
  s.add_development_dependency "bcrypt"
end
