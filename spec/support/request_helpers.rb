module RequestHelpers
  module Helpers
    def click_sign_in
      visit "/"
      click_link "Sign in"
    end

    def click_sign_up
      visit "/"
      click_link "Sign up"
    end

    def click_my_account
      visit "/"
      click_link "My account"
    end

    def login_user(user)
      visit new_user_session_path
      fill_in "Email", :with => "tester@test.com"
      fill_in "Password", :with => "abc123"
      click_button "Sign in"
    end
  end
end

RSpec.configure do |config|
  config.include RequestHelpers::Helpers, :type => :acceptance, :example_group => {
    :file_path => config.escaped_path(%w[spec acceptance])
  }
end
