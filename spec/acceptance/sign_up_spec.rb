require "spec_helper"

feature "Sign up", %q{
  As an un-registered user
  I want to sign up for Caldron
} do
  background { click_sign_up }
  
  scenario "Click Sign up" do
    page.should have_selector "title", :text => "Caldron: Sign up"
    page.should have_selector "form"
  end

  scenario "Successful Sign up" do
    fill_in "Email", :with => "new_tester@test.com"
    fill_in "Name", :with => "New Tester"
    fill_in "Password", :with => "abc123"
    fill_in "Password confirmation", :with => "abc123"
    click_button "Sign up"
    current_path.should == user_root_path
    page.should have_content "Welcome! You have signed up successfully."
  end

  context "Unsuccessful Sign up" do
    scenario "with no email address" do
      fill_in "Name", :with => "New Tester"
      fill_in "Password", :with => "abc123"
      fill_in "Password confirmation", :with => "abc123"
      click_button "Sign up"
      current_path.should == user_registration_path
      page.should have_content "Email can't be blank"
    end

    # I don't know how to test these client side validations
    # scenario "with bad email address" do
    #   fill_in "Email", :with => "new_tester"
    #   fill_in "Name", :with => "New Tester"
    #   fill_in "Password", :with => "abc123"
    #   fill_in "Password confirmation", :with => "abc123"
    #   click_button "Sign up"
    #   current_path.should == user_registration_path
    #   page.should have_content "Email can't be blank"
    # end

    scenario "with no password" do
      fill_in "Email", :with => "new_test@test.com"
      fill_in "Name", :with => "New Tester"
      click_button "Sign up"
      current_path.should == user_registration_path
      page.should have_content "Password can't be blank"
    end

    scenario "with passwords that don't match" do
      fill_in "Email", :with => "new_test@test.com"
      fill_in "Name", :with => "New Tester"
      fill_in "Password", :with => "abc123"
      fill_in "Password confirmation", :with => "123abc"
      click_button "Sign up"
      current_path.should == user_registration_path
      page.should have_content "Password doesn't match confirmation"
    end

    scenario "with a name that's not unique" do
      Factory.create(:user, :name => "New Tester")
      fill_in "Email", :with => "new_test@test.com"
      fill_in "Name", :with => "New Tester"
      fill_in "Password", :with => "abc123"
      fill_in "Password confirmation", :with => "123abc"
      click_button "Sign up"
      current_path.should == user_registration_path
      page.should have_content "Password doesn't match confirmation"
    end
  end
end
