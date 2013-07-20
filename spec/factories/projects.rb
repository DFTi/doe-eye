FactoryGirl.define do
  factory :project do
    name { "Test Project" }
    association :vendor
  end
end
