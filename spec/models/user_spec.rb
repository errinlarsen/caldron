require 'spec_helper'

describe User do
  subject do
    new_user = Factory.build(:user)
    new_user.families << mock_model("Family").as_null_object
    new_user.save!
    new_user
  end
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
    it { should validate_numericality_of(:roles_mask) }
  end

  describe "#roles" do
    it { should respond_to(:roles) }
    it { should respond_to(:roles=) }

    let(:new_roles) { %w[admin child] }
    it "should set the roles_mask correctly" do
      subject.roles = new_roles
      subject.roles_mask.should eq(5)
    end
    it "should return the list of roles" do
      subject.roles = new_roles
      subject.roles.should eq(new_roles)
    end
  end

  describe "#is?" do
    it { should respond_to(:is?) }
    it "should confirm a role was assigned" do
      subject.roles = %w[admin]
      subject.is?("admin").should be_true
    end
    it "should confirm a role was not assigned" do
      subject.roles = %w[admin]
      subject.is?("child").should be_false
    end
  end

  describe "associations" do
    it { should have_many(:chores) }
    it { should have_and_belong_to_many(:assignments) }
    it { should have_and_belong_to_many(:chore_lists) }
    it { should have_and_belong_to_many(:families) }
  end
end
