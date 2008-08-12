require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Playlist do
  before(:each) do
    @playlist = Playlist.new
  end

  it "should be valid" do
    @playlist.should be_valid
  end
end
