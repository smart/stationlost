require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/episodes/index.html.erb" do
  include EpisodesHelper
  
  before(:each) do
    episode_98 = mock_model(Episode)
    episode_99 = mock_model(Episode)

    assigns[:episodes] = [episode_98, episode_99]
  end

  it "should render list of episodes" do
    render "/episodes/index.html.erb"
  end
end

