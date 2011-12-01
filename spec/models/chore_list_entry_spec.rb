require 'spec_helper'

describe ChoreListEntry do
  subject { Factory(:chore_list_entry) }
  it { should be_valid }

  describe "#completed" do
    it { should respond_to(:completed) }
    it { should respond_to(:completed=) }
  end

  describe "#completed?" do
    it { should respond_to(:completed?) }
    it "should return True or False" do
      subject.completed = "true"
      subject.completed?.should be(true)
      subject.completed = nil
      subject.completed?.should be(false)
    end
  end
  
  describe "associations" do
    it { should belong_to(:chore_list) }
    it { should belong_to(:chore) }
  end
end
