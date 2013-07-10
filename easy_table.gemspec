# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Maintain your gem's version:
require "easy_table/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name          = "nie_easy_table"
  s.version       = EasyTable::VERSION
  s.authors       = ["Dianhui Nie"]
  s.email         = ["niedhui@gmail.com"]
  s.homepage      = "http://github.com/niedhui/easy_table"
  s.summary       = "Create Table easily"
  s.description   = "Create Table easily for Rails app"
  s.license       = "MIT"

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]


  s.add_dependency "rails", "> 3.0.0"

  s.add_development_dependency "sqlite3"
end
