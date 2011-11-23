require 'spec_helper'

describe User do
  subject { Factory(:user) }
  it { should be_valid }

  describe "#name" do
    it { should respond_to(:name) }
    it { should respond_to(:name=) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe "#email" do
    it { should respond_to(:email) }
    it { should respond_to(:email=) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe "#password" do
    it { should respond_to(:password) }
    it { should respond_to(:password=) }
  end

  describe "#password_confirmation" do
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:password_confirmation=) }
  end

  describe "#remember_me" do
    it { should respond_to(:remember_me) }
    it { should respond_to(:remember_me=) }
  end

  describe "#chore_lists_by_date" do
    it { should respond_to(:chore_lists_by_date) }
    context "given 6 ChoreLists across 3 different dates" do
      let(:output) { subject.chore_lists_by_date }
      before do
        date = Time.zone.today
        3.times do
          2.times { subject.chore_lists << Factory(:chore_list, :date => date) }
          date += 1.day
        end
      end

      context "chore_lists_by_date" do
        specify { output.should be_a(Hash) }
        specify { output.should have(3).items }
      end

      context "chore_lists_by_date[some_date]" do
        specify { output[Time.zone.today].should be_an(Array) }
        specify { output[Time.zone.today].should have(2).items }
      end

      context "chore_lists_by_date[some_date].values" do
        let(:today) { Time.zone.today }
        specify { output[today].first.should be_a(ChoreList) }
        specify { output[today].first.should satisfy { |cl| cl.date = today }}
      end
    end
  end

  describe "associations" do
    it { should have_many(:chore_lists) }
  end
end
