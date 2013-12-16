# encoding: UTF-8

##
# Exceptions for using the Cisco MSE client
# It is recommended that you handle these.
##

module CiscoMSE

  class GenericException < StandardError; end

  class TimeoutError < GenericException; end

  # Some problems might take care of themselves if you try again later. Others won't.
  class TemporaryError < GenericException; end # fire warnings on these
  class PermanentError < GenericException; end # fire errors on these

  # 404 (Not found)
  class NotFoundError < GenericException; end

  # 500 (Server error)
  class ServiceError < GenericException; end

end
