# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Tester"
    email "tester@test.com"
    password "abc123"
  end

  factory :user_seq do
    sequence(:name) { |n| "Tester#{n}" }
    sequence(:email) { |n| "#{name}@test.com" }
    password "abc123"
  end
end
