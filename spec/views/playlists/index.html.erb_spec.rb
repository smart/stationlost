require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/playlists/index.html.erb" do
  include PlaylistsHelper
  
  before(:each) do
    playlist_98 = mock_model(Playlist)
    playlist_99 = mock_model(Playlist)

    assigns[:playlists] = [playlist_98, playlist_99]
  end

  it "should render list of playlists" do
    render "/playlists/index.html.erb"
  end
end

