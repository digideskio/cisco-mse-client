# encoding: UTF-8

require 'spec_helper'


###
# NOTE: This spec will actually hit CiscoMSE's servers
###

describe 'CiscoMSE::Endpoints::Location' do
  context "Test integration of location endpoints" do

    # Skip if the creds aren't setup
    if defined?(TEST_HOSTNAME) && defined?(TEST_USERNAME) && defined?(TEST_PASSWORD)

      before :each do
        @client = CiscoMSE::Client.create(
          host: TEST_HOSTNAME,
          username: TEST_USERNAME,
          password: TEST_PASSWORD,
          extra_env: {
            ssl: {
              verify: false,
            },
          }
        )
      end

      it 'should get client data' do
        @client.location.clients('test')
      end

    else
      puts "You should put valid creds in _creds.rb"
    end

  end
end
