require "spec_helper"

feature "Creting Chore Lists", %q{
  As a registered parent
  I want to create new chore lists
} do
  let(:parent) { Factory(:user, :email => "tester@test.com") }
  background { login_user(parent) }

  scenario "Parent create a new Chore List" do
    visit chore_lists_path
    page.should have_button("Create")
    fill_in "Title", :with => "Chore list for someone"
    click_button "Create"
    current_path.should == chore_lists_path
    page.should have_content("Chore list for someone")
  end
end
