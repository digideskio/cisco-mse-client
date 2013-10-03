# encoding: UTF-8

require 'spec_helper'



describe Facebook::Stub do
  context 'can stub out calls' do

    before :each do
      Facebook::Client.stub!
      @client = Facebook::Client.create
    end

    describe 'and return test data' do
      it 'for client.user.me' do
        @client.user.me.should == Facebook::Stub::Data::USER
      end

      it 'for client.user.by_id' do
        @client.user.by_id(123).should == Facebook::Stub::Data::USER
      end

      it 'for client.fql.query' do
        @client.fql.query('test').should == Facebook::Stub::Data::FQL_RESPONSE
      end
    end

  end
end
