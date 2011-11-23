require "spec_helper"

feature "Chore Lists", %q{
  As a registered parent
  I want to create chore lists
} do
  let(:parent) { Factory(:user, :email => "tester@test.com") }
  background { login_user(parent) }

  scenario "Parent gets redirected to Chore Lists page" do
    current_path.should == chore_lists_path
    page.should have_content(parent.name)
    page.should have_selector("title", :text => "Caldron: Chore lists")
  end

  scenario "Parent sees their created Chore Lists" do
    today = Time.zone.today
    parent.chore_lists << Factory(:chore_list, :user => parent, :date => today )
    visit chore_lists_path
    page.should have_content(today.inspect)
  end
end
