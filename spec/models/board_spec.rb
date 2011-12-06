require "minitest/autorun"
require "ostruct"
require_relative "../../app/models/board"

describe Board do
  before do
    @it = Board.new
  end

  it "should have no lists" do
    @it.lists.must_be_empty
  end

  describe "#new_list" do
    before do
      @new_list = OpenStruct.new
      @it.list_maker = ->{ @new_list }
    end

    it "should return a new list" do
      @it.new_list.must_equal @new_list
    end

    it "should set the list's board reference to itself" do
      @it.new_list.board.must_equal(@it)
    end

    it "should accept an attribute hash on behalf of the list maker" do
      list_maker = MiniTest::Mock.new
      list_maker.expect(:call, @new_list, [{ :foo => 42, :bar => 'baz'}])
      @it.list_maker = list_maker
      @it.new_list(:foo => 42, :bar => 'baz')
      list_maker.verify
    end
  end

  describe "#add_list" do
    it "should add the list to the board" do
      list = Object.new
      @it.add_list(list)
      @it.lists.must_include(list)
    end
  end
end
