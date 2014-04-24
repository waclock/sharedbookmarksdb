# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :api_key, :class => 'ApiKeys' do
    user_id 1
    public_key "MyString"
    access_token "MyString"
  end
end
