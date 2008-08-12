require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/playlist_clips/new.html.erb" do
  include PlaylistClipsHelper
  
  before(:each) do
    @playlist_clip = mock_model(PlaylistClip)
    @playlist_clip.stub!(:new_record?).and_return(true)
    assigns[:playlist_clip] = @playlist_clip
  end

  it "should render new form" do
    render "/playlist_clips/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", playlist_clips_path) do
    end
  end
end


