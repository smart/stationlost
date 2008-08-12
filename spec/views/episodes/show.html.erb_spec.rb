require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/episodes/show.html.erb" do
  include EpisodesHelper
  
  before(:each) do
    @episode = mock_model(Episode)

    assigns[:episode] = @episode
  end

  it "should render attributes in <p>" do
    render "/episodes/show.html.erb"
  end
end

