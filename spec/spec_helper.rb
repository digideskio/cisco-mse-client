require 'facebook-client'


# Load credentials from ENV if possible, or load from _creds.rb
if ENV['TEST_ACCESS_TOKEN']
  TEST_ACCESS_TOKEN = ENV['TEST_ACCESS_TOKEN']
else
  begin
    require '_creds'
  rescue LoadError
    puts "Using _creds.stub.rb, create a _creds.rb with actual credentials for a live test."
  end
end
