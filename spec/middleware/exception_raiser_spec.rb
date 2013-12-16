# encoding: UTF-8

require 'spec_helper'


describe CiscoMSE::Middleware::ExceptionRaiser do

  describe "Test raising various exceptions using stubs" do

    before :each do
      @stubs = Faraday::Adapter::Test::Stubs.new
      @client = CiscoMSE::Client.create(stubs: @stubs)
    end


    it 'should detect a not found error' do
      @stubs.get("#{CiscoMSE::Client.path_prefix}/") { [ 404, {}, {} ] }
      expect { @client.requester.get('') }.to raise_error(CiscoMSE::NotFoundError)
    end

    it 'should detect a service error' do
      @stubs.get("#{CiscoMSE::Client.path_prefix}/") { [ 500, {}, {} ] }
      expect { @client.requester.get('') }.to raise_error(CiscoMSE::ServiceError)
    end

  end

end
