require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/playlists/edit.html.erb" do
  include PlaylistsHelper
  
  before do
    @playlist = mock_model(Playlist)
    assigns[:playlist] = @playlist
  end

  it "should render edit form" do
    render "/playlists/edit.html.erb"
    
    response.should have_tag("form[action=#{playlist_path(@playlist)}][method=post]") do
    end
  end
end


