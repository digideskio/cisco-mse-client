require 'saddle'
require 'saddle/middleware/authentication/oauth2'

require 'facebook-client/exceptions'
require 'facebook-client/middleware/exception_raiser'
require 'facebook-client/version'



module Facebook

  class Client < Saddle::Client

    def self.host
      'graph.facebook.com'
    end

    def self.use_ssl
      true
    end

    def self.num_retries
      1
    end

    def self.timeout
      5 # seconds
    end


    add_middleware({
      :klass => Middleware::ExceptionRaiser,
    })

    add_middleware({
      :klass => Saddle::Middleware::Authentication::OAuth2,
      :args => ['access_token'],
    })

  end

end
