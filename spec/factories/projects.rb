FactoryGirl.define do
  factory :project do
    name { "Test Project" }
    created_at { DateTime.now - 10 }
    association :vendor
  end
end
