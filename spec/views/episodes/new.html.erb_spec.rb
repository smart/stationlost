require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/episodes/new.html.erb" do
  include EpisodesHelper
  
  before(:each) do
    @episode = mock_model(Episode)
    @episode.stub!(:new_record?).and_return(true)
    assigns[:episode] = @episode
  end

  it "should render new form" do
    render "/episodes/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", episodes_path) do
    end
  end
end


