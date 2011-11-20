# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chore_list do
    date "2011-11-14"
    note "MyString"
    # User association needs to be mocked in specs
    # Family association needs to be mocked in specs
  end
end
