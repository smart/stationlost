require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/clips/show.html.erb" do
  include ClipsHelper
  
  before(:each) do
    @clip = mock_model(Clip)

    assigns[:clip] = @clip
  end

  it "should render attributes in <p>" do
    render "/clips/show.html.erb"
  end
end

