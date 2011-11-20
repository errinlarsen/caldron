# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chore_list_entry do
    completed false
    notes "MyString"
  end
end
