# -*- encoding: utf-8 -*-
require File.expand_path('../lib/facebook-client/version', __FILE__)

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = 'facebook-client'
  s.version       = ::Facebook::VERSION
  s.authors       = ['Mike Lewis']
  s.email         = ['mike.lewis@airbnb.com']
  s.description   = %q{Facebook OAuth2 client}
  s.summary       = %q{
    This is a Facebook OAuth2 client implemented on Saddle
  }
  s.homepage      = 'https://github.com/airbnb/facebook-client'
  s.license       = 'MIT'

  s.require_path  = 'lib'
  s.files         = `git ls-files`.split($\)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})

  s.add_dependency 'saddle', '~> 0.0.38'
end
