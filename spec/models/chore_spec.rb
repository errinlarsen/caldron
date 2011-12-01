require "spec_helper"

describe Chore do
  subject { Factory(:chore) }
  it { should be_valid }

  describe "#name" do
    it { should respond_to(:name) }
    it { should respond_to(:name=) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe "associations" do
    it { should have_many(:chore_lists).through(:chore_list_entries) }
  end
end

