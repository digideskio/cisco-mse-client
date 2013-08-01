# encoding: UTF-8

require 'spec_helper'


describe Facebook::Middleware::ExceptionRaiser do

  describe "Test raising various exceptions using stubs" do

    before :each do
      @stubs = Faraday::Adapter::Test::Stubs.new
      @client = Facebook::Client.create(:stubs => @stubs)
    end


    it 'should detect a service error' do
      @stubs.get('/') { [ 400, {}, { 'error' => { 'code' => 2 } } ] }
      expect { @client.requester.get('') }.to raise_error(Facebook::ServiceError)
    end

    it 'should detect throttling' do
      @stubs.get('/') { [ 400, {}, { 'error' => { 'code' => 9 } } ] }
      expect { @client.requester.get('') }.to raise_error(Facebook::RequestLimitError)
    end

    it 'should detect invalid access tokens' do
      @stubs.get('/') { [ 400, {}, { 'error' => { 'code' => 190 } } ] }
      expect { @client.requester.get('') }.to raise_error(Facebook::InvalidAccessTokenError)
    end

    it 'should detect permission errors' do
      @stubs.get('/') { [ 400, {}, { 'error' => { 'code' => 200 } } ] }
      expect { @client.requester.get('') }.to raise_error(Facebook::PermissionError)
    end

    it 'should detect offline access permission errors' do
      @stubs.get('/') { [ 400, {}, { 'error' => { 'code' => 212 } } ] }
      expect { @client.requester.get('') }.to raise_error(Facebook::OfflineAccessPermissionError)
    end

    it 'should detect general user permission errors' do
      @stubs.get('/') { [ 400, {}, { 'error' => { 'code' => 249 } } ] }
      expect { @client.requester.get('') }.to raise_error(Facebook::UserPermissionError)
    end

    it 'should detect FQL errors' do
      @stubs.get('/') { [ 400, {}, { 'error' => { 'code' => 600 } } ] }
      expect { @client.requester.get('') }.to raise_error(Facebook::FQLError)
    end

  end

end
