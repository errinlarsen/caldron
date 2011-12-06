require "minitest/autorun"
require_relative "../../app/models/chore"

describe Chore do
  before do
    @it = Chore.new
  end

  it "should start with blank attributes" do
    @it.name.must_be_nil
  end

  it "should support reading and writing a name" do
    @it.name = "Chore foo"
    @it.name.must_equal "Chore foo"
  end

  it "should support setting attributes in the initializer" do
    it = Chore.new(:name => "Chore bar")
    it.name.must_equal "Chore bar"
  end

  it "should support reading and writing a list reference" do
    list = Object.new
    @it.list = list
    @it.list.must_equal list
  end

  describe "#write" do
    before do
      @list = MiniTest::Mock.new
      @it.list = @list
    end

    after do
      @list.verify
    end

    it "should add the chore to the list" do
      @list.expect :add_chore, nil, [@it]
      @it.write
    end
  end
end
