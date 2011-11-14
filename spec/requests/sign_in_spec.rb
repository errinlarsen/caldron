require "spec_helper"

feature "Sign in", %q{
  As an administrator
  I want to sign in to Chores
} do
  background { click_sign_in }

  scenario "Click Sign in" do
    page.should have_selector("title", :text => "Chores: Sign in")
    page.should have_selector("form")
  end

  scenario "Successful Sign in" do
    FactoryGirl.create(:user)
    fill_in "Email", :with => "tester@test.com"
    fill_in "Password", :with => "abc123"
    click_button("Sign in")
    current_path.should == user_root_path # this path is used by Devise
  end

  scenario "Unsuccessful Sign in" do
    fill_in "Email", :with => "hacker@getyou.com"
    fill_in "Password", :with => "badpassword"
    click_button("Sign in")
    current_path.should == user_session_path
    page.should have_content("Invalid email or password")
  end
end