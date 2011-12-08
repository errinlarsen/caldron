require "minitest/autorun"
require "ostruct"
require "date"
require_relative "../../app/models/board"

describe Board do
  before do
    @it = Board.new
  end

  it "should have no lists" do
    @it.lists.must_be_empty
  end

  describe "#lists" do
    def stub_list_with_date(date)
      OpenStruct.new(:date => Date.parse(date))
    end

    it "should be sorted in reverse-chronological order" do
      oldest = stub_list_with_date("2011-09-09")
      newest = stub_list_with_date("2011-09-11")
      middle = stub_list_with_date("2011-09-10")

      @it.add_list(oldest)
      @it.add_list(newest)
      @it.add_list(middle)
      @it.lists.must_equal([newest, middle, oldest])
    end

    it "should be limited to 10 lists" do
      10.times { |d| @it.add_list(stub_list_with_date("2011-09-#{d+1}")) }
      oldest = stub_list_with_date("2011-08-30")
      @it.add_list(oldest)
      @it.lists.size.must_equal(10)
      @it.lists.wont_include(oldest)
    end
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
      list = OpenStruct.new(:date => Date.today)
      @it.add_list(list)
      @it.lists.must_include(list)
    end
  end
end
