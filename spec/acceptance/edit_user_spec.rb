require "spec_helper"

feature "Edit account", %q{
  As a registered user
  I want to edit my account
} do
  background do
    user = Factory.create(:user, :name => "tester", :email => "tester@test.com")
    login_user(user)
    click_my_account
  end

  scenario "Click My account" do
    page.should have_selector "title", :text => "Caldron: My account"
    page.should have_selector "form"
  end

  scenario "Change name" do
    pending
  end
end
