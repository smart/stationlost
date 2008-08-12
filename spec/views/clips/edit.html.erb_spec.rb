require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/clips/edit.html.erb" do
  include ClipsHelper
  
  before do
    @clip = mock_model(Clip)
    assigns[:clip] = @clip
  end

  it "should render edit form" do
    render "/clips/edit.html.erb"
    
    response.should have_tag("form[action=#{clip_path(@clip)}][method=post]") do
    end
  end
end


