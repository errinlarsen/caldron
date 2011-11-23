# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chore_list do
    date Time.zone.today
    note "Some Note"
    title "Chores for someone else"
  end
end
