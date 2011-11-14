require 'spec_helper'

describe ApplicationHelper do
  describe "#title" do
    let(:title_text) { "Test" }
    before { helper.title title_text }
    specify { helper.content_for(:title).should == title_text }
  end
end
