require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/playlist_clips/show.html.erb" do
  include PlaylistClipsHelper
  
  before(:each) do
    @playlist_clip = mock_model(PlaylistClip)

    assigns[:playlist_clip] = @playlist_clip
  end

  it "should render attributes in <p>" do
    render "/playlist_clips/show.html.erb"
  end
end

