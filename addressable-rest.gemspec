# -*- encoding: utf-8 -*-
require File.expand_path('../lib/addressable/rest/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Rafael Souza"]
  gem.email         = ["me@rafaelss.com"]
  gem.description   = %q{A really simple HTTP client on top of Addressable::URI}
  gem.summary       = %q{A really simple HTTP client on top of Addressable::URI}
  gem.homepage      = "http://github.com/rafaelss/addressable-rest"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "addressable-rest"
  gem.require_paths = ["lib"]
  gem.version       = Addressable::Rest::VERSION

  gem.add_dependency("addressable", "~> 2.2.6")
  gem.add_dependency("multi_json", "~> 1.0.3")
  gem.add_development_dependency("yajl-ruby", "~> 0.8.3")
  gem.add_development_dependency("fakeweb", "~> 1.3.0")
  gem.add_development_dependency("riot", "~> 0.12.4")
end
