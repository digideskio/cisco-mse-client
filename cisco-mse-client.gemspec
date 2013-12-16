# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cisco-mse-client/version', __FILE__)

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = 'cisco-mse-client'
  s.version       = ::CiscoMSE::VERSION
  s.authors       = ['Mike Lewis']
  s.email         = ['mlewis.mail@gmail.com']
  s.description   = %q{Cisco MSE client}
  s.summary       = %q{
    This is a Cisco MSE client implemented on Saddle
  }
  s.homepage      = 'https://github.com/mLewisLogic/cisco-mse-client'
  s.license       = 'MIT'

  s.require_path  = 'lib'
  s.files         = `git ls-files`.split($\)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})

  s.add_dependency 'saddle', '~> 0.0.49'
end
