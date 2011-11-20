require 'spec_helper'

describe ChoreListEntry do
  subject { Factory(:chore_list_entry) }
  it { should be_valid }

  describe "#completed" do
    it { should respond_to(:completed) }
    it { should respond_to(:completed=) }
    # The following two tests don't REALLY test the validation
    #   The validation that needs to be tested is:
    #   validates_inclusion_of :completed, :in => [true, false]
    #   ... but that doesn't work in RSpec right now
    it { should allow_value(true).for(:completed) }
    it { should allow_value(false).for(:completed) }
  end

  describe "#notes" do
    it { should respond_to(:notes) }
    it { should respond_to(:notes=) }
  end

  describe "associations" do
    it { should belong_to(:chore_list) }
    it { should belong_to(:chore) }
  end
end
