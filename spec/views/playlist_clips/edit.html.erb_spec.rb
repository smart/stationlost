require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/playlist_clips/edit.html.erb" do
  include PlaylistClipsHelper
  
  before do
    @playlist_clip = mock_model(PlaylistClip)
    assigns[:playlist_clip] = @playlist_clip
  end

  it "should render edit form" do
    render "/playlist_clips/edit.html.erb"
    
    response.should have_tag("form[action=#{playlist_clip_path(@playlist_clip)}][method=post]") do
    end
  end
end


