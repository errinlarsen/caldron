# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Tester"
    email "tester@test.com"
    password "abc123"
    roles_mask "2"
  end
end
