# encoding: UTF-8

require 'cisco-mse-client'


# Load credentials from ENV if possible, or load from _creds.rb
if ENV['TEST_USERNAME'] && ENV['TEST_PASSWORD']
  TEST_HOSTNAME = ENV['TEST_HOSTNAME']
  TEST_USERNAME = ENV['TEST_USERNAME']
  TEST_PASSWORD = ENV['TEST_PASSWORD']
else
  begin
    require '_creds'
  rescue LoadError
    puts "Using _creds.stub.rb, create a _creds.rb with actual credentials for a live test."
  end
end
