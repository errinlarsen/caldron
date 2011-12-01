require "spec_helper"

feature "Adding Chores to Chore Lists", %q{
  As a registered parent
  I want to add new chores to an existing chore list
} do
  let(:parent) { Factory(:user_with_chore_list) }
  let(:chore_list) { parent.chore_lists.last }
  background { login_user(parent) }

  scenario "Parent views a Chore List" do
    visit chore_lists_path
    within("dt##{Time.zone.today.to_s}") { click_link chore_list.title }
    current_path.should == chore_list_path(chore_list)
    page.should have_content(chore_list.title)
    page.should have_content(chore_list.date.inspect)
  end

  scenario "Parent adds a new Chore to a Chore List" do
    visit chore_lists_path
    within("dt##{Time.zone.today.to_s}") { click_link chore_list.title }
    fill_in "Name", :with => "A chore to be done"
    click_button "Create"
    current_path.should == chore_list_path(chore_list)
    page.should have_content("A chore to be done")
  end
end
