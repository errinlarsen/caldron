require "minitest/autorun"
require "ostruct"
require "date"
require_relative "../../app/models/list"

describe List do
  before do
    @it = List.new
    @today = Date.today
  end

  it "should start with blank attributes" do
    @it.date.must_be_nil
    @it.title.must_be_nil
  end

  it "should have no chores" do
    @it.chores.must_be_empty
  end

  it "should support reading and writing a title" do
    @it.title = "Someone's chores"
    @it.title.must_equal "Someone's chores"
  end

  it "should support reading and writing a date" do
    @it.date = @today
    @it.date.must_equal @today
  end

  it "should support setting attributes in the initializer" do
    it = List.new(:title => "Some title", :date => @today)
    it.title.must_equal "Some title"
    it.date.must_equal @today
  end

  describe "#new_chore" do
    before do
      @new_chore = OpenStruct.new
      @it.chore_maker = ->{ @new_chore }
    end

    it "should return a new chore" do
      @it.new_chore.must_equal @new_chore
    end

    it "should set the chore's list reference to itself" do
      @it.new_chore.list.must_equal(@it)
    end
  end

  it "should support reading and writing a board reference" do
    board = Object.new
    @it.board = board
    @it.board.must_equal board
  end

  describe "#add_chore" do
    it "should add the chore to the list" do
      chore = Object.new
      @it.add_chore(chore)
      @it.chores.must_inclue(chore)
    end
  end

  describe "#post" do
    before do
      @board = MiniTest::Mock.new
      @it.board = @board
    end

    after do
      @board.verify
    end

    it "should add the list to the board" do
      @board.expect :add_entry, nil, [@it]
      @it.post
    end
  end
end
