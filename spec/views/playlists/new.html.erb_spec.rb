require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/playlists/new.html.erb" do
  include PlaylistsHelper
  
  before(:each) do
    @playlist = mock_model(Playlist)
    @playlist.stub!(:new_record?).and_return(true)
    assigns[:playlist] = @playlist
  end

  it "should render new form" do
    render "/playlists/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", playlists_path) do
    end
  end
end


