# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :family do
    name "FamilyName"
    # User association, members, needs to be mocked in specs
  end
end
