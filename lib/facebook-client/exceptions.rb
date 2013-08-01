# encoding: UTF-8

##
# Exceptions for using the Facebook client
# It is recommended that you handle these.
##

module Facebook

  class GenericException < StandardError; end

  class TimeoutError < GenericException; end

  # Some problems might take care of themselves if you try again later. Others won't.
  class TemporaryError < GenericException; end # fire warnings on these
  class PermanentError < GenericException; end # fire errors on these


  # Error codes are based upon:
  # http://fbdevwiki.com/wiki/Error_codes#Error_Code_Table

  # And for the record, this page is LIES:
  #  https://developers.facebook.com/docs/reference/api/errors/
  # Do not trust it.

  # (0-99) General Errors
  class GeneralError < GenericException; end
  ## (2) Service temporarily unavailable
  class ServiceError < GeneralError; end
  ## (3) Unknown method
  class UnknownMethodError < GeneralError; end
  ## (4, 18) Application request limit reached
  class RequestLimitError < GeneralError; end
  ## (9, 17) User is performing too many actions
  class UserRequestLimitError < RequestLimitError; end
  ## (10) Application does not have permission for this action
  class ApplicationPermissionError < GeneralError; end
  ## (11) This method is deprecated
  class MethodDeprecatedError < GeneralError; end

  # (100-199) Parameter Errors
  class ParameterError < GenericException; end
  ## (101) Invalid API key
  class InvalidAPIKeyError < ParameterError; end
  ## (102) Session key invalid or no longer valid
  class InvalidSessionKeyError < ParameterError; end
  ## (190) Invalid OAuth 2.0 Access Token
  class InvalidAccessTokenError < ParameterError; end

  # (200-299) User Permission Errors
  class UserPermissionError < GenericException; end
  ## (200) Permissions error
  class PermissionError < UserPermissionError; end
  ## (210) User not visible
  class UserNotVisibleError < UserPermissionError; end
  ## (212) Renewing a session offline requires the extended permission offline_access
  class OfflineAccessPermissionError < UserPermissionError; end

  # (300-399) Data Editing Errors
  class DataEditingError < GenericException; end

  # (400-449) Authentication Errors
  class AuthenticationError < GenericException; end

  # (450-455) Session Errors
  class SessionError < GenericException; end

  # (500-599) Application Messaging Errors
  class ApplicationMessagingError < GenericException; end

  # (600-699) FQL Errors
  class FQLError < GenericException; end

  # (700-749) Ref Errors
  class RefError < GenericException; end

  # (750-799) Application Integration Errors
  class ApplicationIntegrationError < GenericException; end

  # (900-949) Application Information Errors
  class ApplicationInformationError < GenericException; end

  # (950-999) Batch API Errors
  class BatchAPIError < GenericException; end

  # ... There's more. Include when needed.
end
