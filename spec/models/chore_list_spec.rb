require 'spec_helper'

describe ChoreList do
  subject { Factory(:chore_list) }
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
    it { should belong_to(:user) }
  end
end
