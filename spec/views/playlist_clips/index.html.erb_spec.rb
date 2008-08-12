require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/playlist_clips/index.html.erb" do
  include PlaylistClipsHelper
  
  before(:each) do
    playlist_clip_98 = mock_model(PlaylistClip)
    playlist_clip_99 = mock_model(PlaylistClip)

    assigns[:playlist_clips] = [playlist_clip_98, playlist_clip_99]
  end

  it "should render list of playlist_clips" do
    render "/playlist_clips/index.html.erb"
  end
end

