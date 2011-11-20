require 'spec_helper'

describe Chore do
  subject do
    new_chore = Factory.build(:chore)
    new_chore.user = mock_model("User").as_null_object
    new_chore.save
    new_chore
  end
  it { should be_valid }

  describe "#name" do
    it { should respond_to(:name) }
    it { should respond_to(:name=) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should validate_presence_of(:user) }
    it { should have_many(:chore_list_entries) }
    it { should have_many(:chore_lists).through(:chore_list_entries) }
  end
end
