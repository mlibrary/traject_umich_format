# -*- encoding: utf-8 -*-

require File.expand_path('../lib/traject/umich_format/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "traject_umich_format"
  gem.version       = Traject::UMichFormat::VERSION
  gem.summary       = %q{Extract the format and type from a MARC record, the UMich way}
  gem.description   = %q{The algorithm used by the University of Michigan University Library to determine format (book, serial, etc.) and type (audio, video, conference, etc.) from a (ruby marc) MARC record}
  gem.license       = "MIT"
  gem.authors       = ["Bill Dueber"]
  gem.email         = "bill@dueber.com"
  gem.homepage      = "https://github.com/billdueber/traject_umich_format#readme"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'yard'
end
