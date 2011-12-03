require "spec_helper"

feature "Deleting Chore Lists", %q{
  As a registered parent
  I want to delete old chore lists
} do
  let(:parent) { Factory(:user) }
  let(:today) { Time.zone.today }
  let(:chore_list) { Factory(:chore_list, :user => parent, :date => today ) }
  background { login_user(parent) }

  scenario "Parent deletes an old Chore List from list page" do
    parent.chore_lists << chore_list
    visit chore_lists_path
    page.should have_link("x",
                          :url => chore_list_path(parent.chore_lists.first),
                          :method => :delete)
    click_link "x"
    current_path.should == chore_lists_path
    page.should have_content("Successfully removed chore list.")
  end

  scenario "Parent deletes an old Chore List from show page" do
    parent.chore_lists << chore_list
    visit chore_lists_path
    within("dt##{Time.zone.today.to_s}") { click_link chore_list.title }
    page.should have_button("Delete list")
    click_button "Delete list"
    current_path.should == chore_lists_path
    page.should have_content("Successfully removed chore list.")
  end
end
