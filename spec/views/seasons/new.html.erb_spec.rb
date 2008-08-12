require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/seasons/new.html.erb" do
  include SeasonsHelper
  
  before(:each) do
    @season = mock_model(Season)
    @season.stub!(:new_record?).and_return(true)
    assigns[:season] = @season
  end

  it "should render new form" do
    render "/seasons/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", seasons_path) do
    end
  end
end


