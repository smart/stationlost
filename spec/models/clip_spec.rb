require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Clip do
  before(:each) do
    @clip = Clip.new
  end

  it "should be valid" do
    @clip.should be_valid
  end
end
