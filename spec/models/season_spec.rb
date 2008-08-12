require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Season do
  before(:each) do
    @season = Season.new
  end

  it "should be valid" do
    @season.should be_valid
  end
end
