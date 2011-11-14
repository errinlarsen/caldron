require 'spec_helper'

feature 'Home page', %q{
  As an unregistered user
  I want to see the home/landing page
} do

  scenario "Visit Home page" do
    visit "/"
    page.should have_link("Sign in")
    page.should have_selector("title", :content => "Chores")
    page.should have_content("Welcome to the Chores WebApp")
  end
end