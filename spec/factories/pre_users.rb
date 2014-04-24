# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pre_user do
    email "MyString"
    active false
    location "MyString"
  end
end
