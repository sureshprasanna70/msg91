require "spec_helper"

RSpec.describe Msg91::Message do

  describe "message" do
    before(:each) do 
      Msg91.configure do |config|
        config.auth_key = ENV['MSG91_AUTH_KEY']
      end
    end

    it 'send_text with valid phone number' do
      message = Msg91::Message.send_text('SENDERID','4','91',['9999999999'],'TEST MESSAGE')
      expect(message["type"]).to eq("success")
    end

    it 'send_text with invalid phone_number' do
      message = Msg91::Message.send_text('SENDERID','4','91',['999999A'],'TEST MESSAGE')
      expect(message["type"]).to eq("error")
    end

  end
end
