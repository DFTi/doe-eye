FactoryGirl.define do
  factory :document do
    title { "Test Document" }
    association :project
  end
end
