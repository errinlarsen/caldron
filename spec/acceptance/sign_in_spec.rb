require "spec_helper"

feature "Sign in", %q{
  As a registered user
  I want to sign in to Caldron
} do
  background { click_sign_in }

  scenario "Click Sign in" do
    page.should have_selector("title", :text => "Caldron: Sign in")
    page.should have_selector("form")
  end

  scenario "Successful Sign in" do
    Factory.create(:user, :name => "tester", :email => "tester@test.com")
    fill_in "Email", :with => "tester@test.com"
    fill_in "Password", :with => "abc123"
    click_button "Sign in"
    current_path.should == user_root_path
    page.should have_content "Signed in successfully."
  end

  scenario "Unsuccessful Sign in" do
    fill_in "Email", :with => "hacker@getyou.com"
    fill_in "Password", :with => "badpassword"
    click_button("Sign in")
    current_path.should == user_session_path
    page.should have_content("Invalid email or password")
  end
end
