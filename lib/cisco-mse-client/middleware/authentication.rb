require 'base64'

require 'faraday'



module CiscoMSE
  module Middleware
    module Request

      # Authenticate our request
      class Authentication < Faraday::Middleware
        def call(env)
          if env[:request][:client_options][:username] && env[:request][:client_options][:password]
            username = env[:request][:client_options][:username]
            password = env[:request][:client_options][:password]
            encoded_string = Base64.encode64("#{username}:#{password}")

            env[:request_headers]['Authorization'] = "Basic #{encoded_string}"
          end

          @app.call(env)
        end
      end

    end
  end
end
