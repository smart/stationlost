require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/clips/index.html.erb" do
  include ClipsHelper
  
  before(:each) do
    clip_98 = mock_model(Clip)
    clip_99 = mock_model(Clip)

    assigns[:clips] = [clip_98, clip_99]
  end

  it "should render list of clips" do
    render "/clips/index.html.erb"
  end
end

