require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PlaylistClip do
  before(:each) do
    @playlist_clip = PlaylistClip.new
  end

  it "should be valid" do
    @playlist_clip.should be_valid
  end
end
