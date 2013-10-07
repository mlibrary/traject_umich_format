# -*- encoding: utf-8 -*-

require File.expand_path('../lib/traject_umich_format/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "traject_umich_format"
  gem.version       = TrajectUmichFormat::VERSION
  gem.summary       = %q{TODO: Summary}
  gem.description   = %q{TODO: Description}
  gem.license       = "MIT"
  gem.authors       = ["Bill Dueber"]
  gem.email         = "bill@dueber.com"
  gem.homepage      = "https://github.com/billdueber/traject_umich_format#readme"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler', '~> 1.0'
  gem.add_development_dependency 'rake', '~> 0.8'
  gem.add_development_dependency 'yard', '~> 0.8'
end
