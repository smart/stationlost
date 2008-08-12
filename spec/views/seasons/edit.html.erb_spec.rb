require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/seasons/edit.html.erb" do
  include SeasonsHelper
  
  before do
    @season = mock_model(Season)
    assigns[:season] = @season
  end

  it "should render edit form" do
    render "/seasons/edit.html.erb"
    
    response.should have_tag("form[action=#{season_path(@season)}][method=post]") do
    end
  end
end


