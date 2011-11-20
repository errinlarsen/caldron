require 'spec_helper'

describe ChoreList do
  subject do
    new_chore_list = Factory.build(:chore_list)
    new_chore_list.family = mock_model("Family").as_null_object
    new_chore_list.user = mock_model("User").as_null_object
    new_chore_list.save
    new_chore_list
  end
  it { should be_valid }

  describe "#date" do
    it { should respond_to(:date) }
    it { should respond_to(:date=) }
    it { should validate_presence_of(:date) }
  end

  describe "#note" do
    it { should respond_to(:note) }
    it { should respond_to(:note=) }
  end

  describe "associations" do
    it { should belong_to(:family) }
    it { should validate_presence_of(:family) }
    it { should belong_to(:user) }
    it { should validate_presence_of(:user) }
    it { should have_many(:chore_list_entries) }
    it { should have_many(:chores).through(:chore_list_entries) }
    it { should have_and_belong_to_many(:workers) }
  end
end
