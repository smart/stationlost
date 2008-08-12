require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/seasons/index.html.erb" do
  include SeasonsHelper
  
  before(:each) do
    season_98 = mock_model(Season)
    season_99 = mock_model(Season)

    assigns[:seasons] = [season_98, season_99]
  end

  it "should render list of seasons" do
    render "/seasons/index.html.erb"
  end
end

