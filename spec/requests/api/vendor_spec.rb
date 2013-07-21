require 'spec_helper'

describe API do
  let(:vendor) { FactoryGirl.create :vendor }

  describe Vendor do
    describe "Authenticate Vendor" do
      it "should return access_token" do
        post "/api/v1/vendor/login/", api_key: vendor.api_key, api_password: vendor.api_password
        JSON.parse(response.body)["access_token"].should eq(vendor.authorizations.first.access_token) 
      end
    end
  end
end
