# encoding: UTF-8

require 'spec_helper'



describe CiscoMSE::Stub do
  context 'can stub out calls' do

    before :each do
      CiscoMSE::Client.stub!
      @client = CiscoMSE::Client.create
    end

    describe 'and return test data' do
      it 'for location.clients' do
        @client.location.clients('test').should == CiscoMSE::Stub::Data::Location::CLIENTS
      end
    end

  end
end
