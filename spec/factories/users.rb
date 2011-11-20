# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Tester#{n}" }
    sequence(:email) { |n| "tester#{n}@test.com" }
    password "abc123"
    password_confirmation "abc123"
    roles_mask "2"
    # Family association needs to be mocked in specs
  end
end
