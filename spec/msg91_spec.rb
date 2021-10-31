require 'spec_helper'

RSpec.describe Msg91 do
  describe '#configure' do
    before(:each) do
      Msg91.configure do |config|
        config.auth_key = ENV['MSG91_AUTH_KEY']
      end
    end

    it 'has a version number' do
      expect(Msg91::VERSION).not_to be nil
    end

    it 'has a auth_key' do
      auth_key = Msg91.configuration.auth_key
      expect(auth_key).to eq(ENV['MSG91_AUTH_KEY'])
    end
  end
end
