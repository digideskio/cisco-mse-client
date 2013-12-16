# encoding: UTF-8

require 'faraday'

require 'cisco-mse-client/exceptions'



module CiscoMSE
  module Middleware

    ## Raise beautiful exceptions
    #
    class ExceptionRaiser < Faraday::Middleware

      ## For handling errors, the message that gets returned is of the following format:
      # {:status => env[:status], :headers => env[:response_headers], :body => env[:body]}

      def call(env)
        begin
          @app.call(env)
        rescue Faraday::Error::ClientError => e
          exception =
            case e.response[:status]
            when 404
              CiscoMSE::NotFoundError
            when 500
              CiscoMSE::ServiceError
            else
              CiscoMSE::GenericException
            end
          raise exception, e.response
        rescue Saddle::TimeoutError => e
          raise CiscoMSE::TimeoutError, e.response
        end
      end

    end

  end
end
