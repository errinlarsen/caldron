require 'spec_helper'

describe Family do
  subject do
    Factory(:family)
    # f = Factory.build(:family)
    # f.members << mock_model("User").as_null_object
    # f.chore_lists << mock_model("ChoreList").as_null_object
    # f.save!
    # f
  end
  it { should be_valid }

  describe "#name" do
    it { should respond_to(:name) }
    it { should respond_to(:name=) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe "associations" do
    it { should have_many(:members) }
    it { should validate_presence_of(:members) }
    it { should have_many(:chore_lists) }
  end
end
