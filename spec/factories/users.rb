# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Иван"
    last_name "Лапин"
    email "ivan@ivan.com"
    password "123456"
    roles_mask "MyString"
  end
end
