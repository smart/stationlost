require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/clips/new.html.erb" do
  include ClipsHelper
  
  before(:each) do
    @clip = mock_model(Clip)
    @clip.stub!(:new_record?).and_return(true)
    assigns[:clip] = @clip
  end

  it "should render new form" do
    render "/clips/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", clips_path) do
    end
  end
end


