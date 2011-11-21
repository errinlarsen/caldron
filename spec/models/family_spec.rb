require 'spec_helper'

describe Family do
  subject do
    new_family = Factory.build(:family)
    new_family.members << mock_model("User").as_null_object
    new_family.save!
    new_family
  end
  it { should be_valid }

  describe "#name" do
    it { should respond_to(:name) }
    it { should respond_to(:name=) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe "associations" do
    it { should have_many(:chore_lists) }
    it { should have_and_belong_to_many(:members) }
  end
end
