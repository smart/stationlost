require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/episodes/edit.html.erb" do
  include EpisodesHelper
  
  before do
    @episode = mock_model(Episode)
    assigns[:episode] = @episode
  end

  it "should render edit form" do
    render "/episodes/edit.html.erb"
    
    response.should have_tag("form[action=#{episode_path(@episode)}][method=post]") do
    end
  end
end


