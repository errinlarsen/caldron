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

  describe "#roles_mask" do
    it { should validate_presence_of(:roles_mask) }
  end

  describe "#roles" do
    it { should respond_to(:roles) }
    it { should respond_to(:roles=) }
  end

  describe "associations" do
    it { should belong_to(:family) }
    it { should have_many(:chores) }
    it { should have_and_belong_to_many(:chore_lists) }
    it { should have_and_belong_to_many(:assignments) }
  end
end
