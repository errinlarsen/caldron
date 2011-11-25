require "spec_helper"

feature "Edit account", %q{
  As a registered user
  I want to edit my account
} do
  background do
    @user = Factory.create(:user)
    login_user(@user)
    click_my_account
  end

  scenario "Click My account" do
    page.should have_selector "title", :text => "Caldron: My account"
    page.should have_selector "form"
    find_by_id("user_email").value.should == "tester@test.com"
    find_by_id("user_name").value.should == "Tester"
  end

  scenario "Successful name change" do
    fill_in "Name", :with => "New Name"
    fill_in "Current password", :with => "abc123"
    click_button "Update"
    current_path.should == user_root_path
    page.should have_content "You updated your account successfully."
    page.should have_content "New Name"
  end

  context "Unsuccessful name change" do
    background { fill_in "Name", :with => "New Name" }

    scenario "with a name that's not unique" do
      Factory.create(:user, :name => "New Name",
                     :email => "some_other_email@test.com")
      fill_in "Current password", :with => "abc123"
      click_button "Update"
      current_path.should == "/users" # there has got to be a better way
      page.should have_content "Name has already been taken"
    end

    scenario "with bad Current password" do
      fill_in "Current password", :with => "123abc"
      click_button "Update"
      current_path.should == "/users" # there has got to be a better way
      page.should have_content "Current password is invalid"
    end

    scenario "with no Current password" do
      click_button "Update"
      current_path.should == "/users" # there has got to be a better way
      page.should have_content "Current password can't be blank"
    end
  end

  scenario "Successful email change" do
    fill_in "Email", :with => "new_tester@new_test.com"
    fill_in "Current password", :with => "abc123"
    click_button "Update"
    current_path.should == user_root_path
    page.should have_content "You updated your account successfully."
    click_my_account
    find_by_id("user_email").value.should == "new_tester@new_test.com"
  end

  context "Unsuccessful email change" do
    background { fill_in "Email", :with => "new_tester@new_test.com" }

    scenario "with an email that's not unique" do
      Factory.create(:user, :name => "Someone Else",
                     :email => "new_tester@new_test.com")
      fill_in "Current password", :with => "abc123"
      click_button "Update"
      current_path.should == "/users" # there has got to be a better way
      page.should have_content "Email has already been taken"
    end

    scenario "with bad Current password" do
      fill_in "Current password", :with => "123abc"
      click_button "Update"
      current_path.should == "/users" # there has got to be a better way
      page.should have_content "Current password is invalid"
    end

    scenario "with no Current password" do
      click_button "Update"
      current_path.should == "/users" # there has got to be a better way
      page.should have_content "Current password can't be blank"
    end
  end

  scenario "Successful password change" do
    original_password = @user.password
    fill_in "Password", :with => "123abc"
    fill_in "Password confirmation", :with => "123abc"
    fill_in "Current password", :with => "abc123"
    click_button "Update"
    current_path.should == user_root_path
    page.should have_content "You updated your account successfully."
    changed_user = User.find_by_email(@user.email)
    changed_user.password.should_not == original_password
  end

  context "Unsuccessful password change" do
    background do
      fill_in "Password", :with => "123abc"
      fill_in "Password confirmation", :with => "123abc"
    end

    scenario "with bad Current password" do
      fill_in "Current password", :with => "wrong password"
      click_button "Update"
      current_path.should == "/users" # there has got to be a better way
      page.should have_content "Current password is invalid"
    end
    
    scenario "with no Current password" do
      click_button "Update"
      current_path.should == "/users" # there has got to be a better way
      page.should have_content "Current password can't be blank"
    end

    scenario "with passwords that don't match" do
      fill_in "Password", :with => "something else"
      click_button "Update"
      current_path.should == "/users" # there has got to be a better way
      page.should have_content "Password doesn't match confirmation"
    end
  end
end
