require "spec_helper"

module Msg91
  describe Configuration do
    describe "#auth_key" do
      it "default value is nil" do
        auth_key = Msg91::Configuration.new.auth_key
        expect(auth_key).to eq(nil)
      end
    end
  end
end
