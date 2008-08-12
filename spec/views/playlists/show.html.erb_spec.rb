require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/playlists/show.html.erb" do
  include PlaylistsHelper
  
  before(:each) do
    @playlist = mock_model(Playlist)

    assigns[:playlist] = @playlist
  end

  it "should render attributes in <p>" do
    render "/playlists/show.html.erb"
  end
end

