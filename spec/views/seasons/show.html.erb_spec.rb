require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/seasons/show.html.erb" do
  include SeasonsHelper
  
  before(:each) do
    @season = mock_model(Season)

    assigns[:season] = @season
  end

  it "should render attributes in <p>" do
    render "/seasons/show.html.erb"
  end
end

