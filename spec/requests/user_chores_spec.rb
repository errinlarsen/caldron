require "spec_helper"

feature "Unauthorized User Chores page", %q{
  As a user that is not signed in
  I should not be able to
  go to the user chores page
} do
  background do
    @user = Factory(:user)
  end

  scenario "User is not signed in" do
    visit chores_path
    current_path.should == new_user_session_path
  end
end

feature "Signed in User Chores page", %q{
  As a signed in parent
  I want to see my chores
  on my chores page
} do
  background do
    @user = Factory(:user)
    @chore = Factory(:chore, :user => @user)
    login_user(@user)
  end

  scenario "User is signed in" do
    visit chores_path
    page.should have_content(@user.name)
    page.should have_content(@chore.name)
  end
end
