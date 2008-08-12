require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EpisodesController do
  describe "handling GET /episodes" do

    before(:each) do
      @episode = mock_model(Episode)
      Episode.stub!(:find).and_return([@episode])
    end
  
    def do_get
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all episodes" do
      Episode.should_receive(:find).with(:all).and_return([@episode])
      do_get
    end
  
    it "should assign the found episodes for the view" do
      do_get
      assigns[:episodes].should == [@episode]
    end
  end

  describe "handling GET /episodes.xml" do

    before(:each) do
      @episodes = mock("Array of Episodes", :to_xml => "XML")
      Episode.stub!(:find).and_return(@episodes)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all episodes" do
      Episode.should_receive(:find).with(:all).and_return(@episodes)
      do_get
    end
  
    it "should render the found episodes as xml" do
      @episodes.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /episodes/1" do

    before(:each) do
      @episode = mock_model(Episode)
      Episode.stub!(:find).and_return(@episode)
    end
  
    def do_get
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the episode requested" do
      Episode.should_receive(:find).with("1").and_return(@episode)
      do_get
    end
  
    it "should assign the found episode for the view" do
      do_get
      assigns[:episode].should equal(@episode)
    end
  end

  describe "handling GET /episodes/1.xml" do

    before(:each) do
      @episode = mock_model(Episode, :to_xml => "XML")
      Episode.stub!(:find).and_return(@episode)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the episode requested" do
      Episode.should_receive(:find).with("1").and_return(@episode)
      do_get
    end
  
    it "should render the found episode as xml" do
      @episode.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /episodes/new" do

    before(:each) do
      @episode = mock_model(Episode)
      Episode.stub!(:new).and_return(@episode)
    end
  
    def do_get
      get :new
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new episode" do
      Episode.should_receive(:new).and_return(@episode)
      do_get
    end
  
    it "should not save the new episode" do
      @episode.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new episode for the view" do
      do_get
      assigns[:episode].should equal(@episode)
    end
  end

  describe "handling GET /episodes/1/edit" do

    before(:each) do
      @episode = mock_model(Episode)
      Episode.stub!(:find).and_return(@episode)
    end
  
    def do_get
      get :edit, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end
  
    it "should find the episode requested" do
      Episode.should_receive(:find).and_return(@episode)
      do_get
    end
  
    it "should assign the found Episode for the view" do
      do_get
      assigns[:episode].should equal(@episode)
    end
  end

  describe "handling POST /episodes" do

    before(:each) do
      @episode = mock_model(Episode, :to_param => "1")
      Episode.stub!(:new).and_return(@episode)
    end
    
    describe "with successful save" do
  
      def do_post
        @episode.should_receive(:save).and_return(true)
        post :create, :episode => {}
      end
  
      it "should create a new episode" do
        Episode.should_receive(:new).with({}).and_return(@episode)
        do_post
      end

      it "should redirect to the new episode" do
        do_post
        response.should redirect_to(episode_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @episode.should_receive(:save).and_return(false)
        post :create, :episode => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /episodes/1" do

    before(:each) do
      @episode = mock_model(Episode, :to_param => "1")
      Episode.stub!(:find).and_return(@episode)
    end
    
    describe "with successful update" do

      def do_put
        @episode.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the episode requested" do
        Episode.should_receive(:find).with("1").and_return(@episode)
        do_put
      end

      it "should update the found episode" do
        do_put
        assigns(:episode).should equal(@episode)
      end

      it "should assign the found episode for the view" do
        do_put
        assigns(:episode).should equal(@episode)
      end

      it "should redirect to the episode" do
        do_put
        response.should redirect_to(episode_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @episode.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /episodes/1" do

    before(:each) do
      @episode = mock_model(Episode, :destroy => true)
      Episode.stub!(:find).and_return(@episode)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the episode requested" do
      Episode.should_receive(:find).with("1").and_return(@episode)
      do_delete
    end
  
    it "should call destroy on the found episode" do
      @episode.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the episodes list" do
      do_delete
      response.should redirect_to(episodes_url)
    end
  end
end
