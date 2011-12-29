# -*- encoding: utf-8 -*-
require File.expand_path('../lib/tab_menu/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dan Pickett"]
  gem.email         = ["dpickett@enlightsolutions.com"]
  gem.description   = %q{Rails Gem to generate tabs}
  gem.summary       = %q{Rails Gem to generate tabs}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "tab_menu"
  gem.require_paths = ["lib"]
  gem.version       = TabMenu::VERSION
  
  gem.add_dependency "rake"
  gem.add_dependency "actionpack"
  
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "mocha"
  gem.add_development_dependency "rails"
end
