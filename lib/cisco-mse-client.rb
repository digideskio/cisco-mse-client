# encoding: UTF-8

require 'saddle'

require 'cisco-mse-client/exceptions'
require 'cisco-mse-client/middleware/authentication'
require 'cisco-mse-client/middleware/exception_raiser'
require 'cisco-mse-client/middleware/set_format'
require 'cisco-mse-client/stub'
require 'cisco-mse-client/version'



module CiscoMSE

  class Client < Saddle::Client
    extend CiscoMSE::Stub

    def self.host
      'localhost'
    end

    def self.path_prefix
      'api/contextaware/v1'
    end

    def self.use_ssl
      true
    end


    add_middleware({
      klass: CiscoMSE::Middleware::ExceptionRaiser,
    })

    add_middleware({
      klass: CiscoMSE::Middleware::Request::Authentication,
    })

    add_middleware({
      klass: CiscoMSE::Middleware::Request::SetFormat,
    })

  end

end
