include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :document do
    title { "Test Document" }
    file { fixture_file_upload(Rails.root.join("spec","fixtures","test.pdf").to_s, "application/x-pdf") }
    association :project
  end
end
