require 'spec_helper'


###
# NOTE: This spec will actually hit Facebook's servers
###

describe 'Facebook::Endpoints::FQL' do
  context "Test integration of FQL endpoints" do

    # Skip if the creds aren't setup
    if defined?(TEST_ACCESS_TOKEN)

      before :each do
        @client = Facebook::Client.create(:access_token => TEST_ACCESS_TOKEN)
      end

      it 'should get self info' do
        @client.fql.query('SELECT name FROM user WHERE uid = me()').should_not be_nil
      end

    else
      puts "You should put valid creds in _creds.rb"
    end

  end
end
