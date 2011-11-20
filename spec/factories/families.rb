# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :family do
    name "FamilyName"
    after_build do |f|
      f.members << mock_model("User").as_null_object
      f.chore_lists << mock_model("ChoreList").as_null_object
    end
  end
  factory :family_with_member do
    name "FamilyName"
    after_build { |f| f.members << Factory(:user, :family => f) }
  end
  factory :family_with_member_and_chore_list do
    name "FamilyName"
    after_build { |f| f.members << Factory(:user, :family => f) }
    after_create { |f| Factory(:chore_list, :family => f) }
  end
end
