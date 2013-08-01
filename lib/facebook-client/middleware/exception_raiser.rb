# encoding: UTF-8

require 'faraday'

require 'facebook-client/exceptions'



module Facebook
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
          # Error codes are based upon:
          # http://fbdevwiki.com/wiki/Error_codes#Error_Code_Table
          fb_error_code = e.response[:body].try(:[], 'error').try(:[], 'code')

          # Translate our error code into an exception
          exception =
            case fb_error_code
            ## (0-99) General Errors
            when 2
              Facebook::ServiceError
            when 3
              Facebook::UnknownMethodError
            when 4, 18, 9, 17
              Facebook::RequestLimitError
            when 10
              Facebook::ApplicationPermissionError
            when 11
              Facebook::MethodDeprecatedError
            when 0..99
              Facebook::GeneralError
            ## (100-199) Parameter Errors
            when 101
              Facebook::InvalidAPIKeyError
            when 102
              Facebook::InvalidSessionKeyError
            when 190
              Facebook::InvalidAccessTokenError
            when 100..199
              Facebook::ParameterError
            ## (200-299) User Permission Errors
            when 200
              Facebook::PermissionError
            when 212
              Facebook::OfflineAccessPermissionError
            when 200..299
              Facebook::UserPermissionError
            ## (300-399) Data Editing Errors
            when 300..399
              Facebook::DataEditingError
            ## (400-449) Authentication Errors
            when 400..449
              Facebook::AuthenticationError
            ## (450-455) Session Errors
            when 450..455
              Facebook::SessionError
            ## (500-599) Application Messaging Errors
            when 500..599
              Facebook::ApplicationMessagingError
            ## (600-699) FQL Errors
            when 600..699
              Facebook::FQLError
            ## (700-749) Ref Errors
            when 700..749
              Facebook::RefError
            ## (750-799) Application Integration Errors
            when 750..799
              Facebook::ApplicationIntegrationError
            ## (900-949) Application Information Errors
            when 900..949
              Facebook::ApplicationInformationError
            ## (950-999) Batch API Errors
            when 950..999
              Facebook::BatchAPIError
            else
              Facebook::GenericException
            end

          raise exception, e.response
        rescue Saddle::TimeoutError => e
          raise Facebook::TimeoutError, e.response
        end
      end

    end

  end
end
