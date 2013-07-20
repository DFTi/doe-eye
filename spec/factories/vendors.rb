FactoryGirl.define do
  factory :vendor do
    name { "Test Vendor" }
    api_key { "test_api_key" }
    api_password { "password" }
  end
end
