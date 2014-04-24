# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :token, :class => 'Tokens' do
    user_id 1
    value "MyString"
  end
end
