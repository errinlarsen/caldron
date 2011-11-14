# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chore_list do
    date "2011-11-14"
    notes "MyString"
    family_id 1
  end
end
