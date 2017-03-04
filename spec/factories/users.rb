# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "admin@wednesdayworlds.org"
    password_digest "secret"
  end
end
