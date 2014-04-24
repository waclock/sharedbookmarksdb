# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blacklist, :class => 'Blacklists' do
    email_to "MyString"
    email_from "MyString"
    global false
  end
end
