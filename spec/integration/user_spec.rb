require 'spec_helper'


###
# NOTE: This spec will actually hit Facebook's servers
###

describe 'Facebook::Endpoints::User' do
  context "Test integration of user endpoints" do

    # Skip if the creds aren't setup
    if defined?(TEST_ACCESS_TOKEN)

      before :each do
        @client = Facebook::Client.create(:access_token => TEST_ACCESS_TOKEN)
      end

      it 'should get self profile' do
        @client.user.me.should be_a(Hash)
      end

    else
      puts "You should put valid creds in _creds.rb"
    end

  end
end
