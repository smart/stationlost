require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SeasonsController do
  describe "handling GET /seasons" do

    before(:each) do
      @season = mock_model(Season)
      Season.stub!(:find).and_return([@season])
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
  
    it "should find all seasons" do
      Season.should_receive(:find).with(:all).and_return([@season])
      do_get
    end
  
    it "should assign the found seasons for the view" do
      do_get
      assigns[:seasons].should == [@season]
    end
  end

  describe "handling GET /seasons.xml" do

    before(:each) do
      @seasons = mock("Array of Seasons", :to_xml => "XML")
      Season.stub!(:find).and_return(@seasons)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all seasons" do
      Season.should_receive(:find).with(:all).and_return(@seasons)
      do_get
    end
  
    it "should render the found seasons as xml" do
      @seasons.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /seasons/1" do

    before(:each) do
      @season = mock_model(Season)
      Season.stub!(:find).and_return(@season)
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
  
    it "should find the season requested" do
      Season.should_receive(:find).with("1").and_return(@season)
      do_get
    end
  
    it "should assign the found season for the view" do
      do_get
      assigns[:season].should equal(@season)
    end
  end

  describe "handling GET /seasons/1.xml" do

    before(:each) do
      @season = mock_model(Season, :to_xml => "XML")
      Season.stub!(:find).and_return(@season)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the season requested" do
      Season.should_receive(:find).with("1").and_return(@season)
      do_get
    end
  
    it "should render the found season as xml" do
      @season.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /seasons/new" do

    before(:each) do
      @season = mock_model(Season)
      Season.stub!(:new).and_return(@season)
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
  
    it "should create an new season" do
      Season.should_receive(:new).and_return(@season)
      do_get
    end
  
    it "should not save the new season" do
      @season.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new season for the view" do
      do_get
      assigns[:season].should equal(@season)
    end
  end

  describe "handling GET /seasons/1/edit" do

    before(:each) do
      @season = mock_model(Season)
      Season.stub!(:find).and_return(@season)
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
  
    it "should find the season requested" do
      Season.should_receive(:find).and_return(@season)
      do_get
    end
  
    it "should assign the found Season for the view" do
      do_get
      assigns[:season].should equal(@season)
    end
  end

  describe "handling POST /seasons" do

    before(:each) do
      @season = mock_model(Season, :to_param => "1")
      Season.stub!(:new).and_return(@season)
    end
    
    describe "with successful save" do
  
      def do_post
        @season.should_receive(:save).and_return(true)
        post :create, :season => {}
      end
  
      it "should create a new season" do
        Season.should_receive(:new).with({}).and_return(@season)
        do_post
      end

      it "should redirect to the new season" do
        do_post
        response.should redirect_to(season_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @season.should_receive(:save).and_return(false)
        post :create, :season => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /seasons/1" do

    before(:each) do
      @season = mock_model(Season, :to_param => "1")
      Season.stub!(:find).and_return(@season)
    end
    
    describe "with successful update" do

      def do_put
        @season.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the season requested" do
        Season.should_receive(:find).with("1").and_return(@season)
        do_put
      end

      it "should update the found season" do
        do_put
        assigns(:season).should equal(@season)
      end

      it "should assign the found season for the view" do
        do_put
        assigns(:season).should equal(@season)
      end

      it "should redirect to the season" do
        do_put
        response.should redirect_to(season_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @season.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /seasons/1" do

    before(:each) do
      @season = mock_model(Season, :destroy => true)
      Season.stub!(:find).and_return(@season)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the season requested" do
      Season.should_receive(:find).with("1").and_return(@season)
      do_delete
    end
  
    it "should call destroy on the found season" do
      @season.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the seasons list" do
      do_delete
      response.should redirect_to(seasons_url)
    end
  end
end
