# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :personal_message do
    body "MyText"
    conversation nil
    iser nil
  end
end
