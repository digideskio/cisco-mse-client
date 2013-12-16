require 'faraday'



module CiscoMSE
  module Middleware
    module Request

      # Let the service know that we expect/accept JSON

      class SetFormat < Faraday::Middleware
        def call(env)
          env[:request_headers]['Accept'] = 'application/json'

          @app.call(env)
        end
      end

    end
  end
end
