# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Tester#{n}" }
    sequence(:email) { |n| "#{name}@test.com" }
    password "abc123"
  end
end
