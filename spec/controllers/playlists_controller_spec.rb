require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PlaylistsController do
  describe "handling GET /playlists" do

    before(:each) do
      @playlist = mock_model(Playlist)
      Playlist.stub!(:find).and_return([@playlist])
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
  
    it "should find all playlists" do
      Playlist.should_receive(:find).with(:all).and_return([@playlist])
      do_get
    end
  
    it "should assign the found playlists for the view" do
      do_get
      assigns[:playlists].should == [@playlist]
    end
  end

  describe "handling GET /playlists.xml" do

    before(:each) do
      @playlists = mock("Array of Playlists", :to_xml => "XML")
      Playlist.stub!(:find).and_return(@playlists)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all playlists" do
      Playlist.should_receive(:find).with(:all).and_return(@playlists)
      do_get
    end
  
    it "should render the found playlists as xml" do
      @playlists.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /playlists/1" do

    before(:each) do
      @playlist = mock_model(Playlist)
      Playlist.stub!(:find).and_return(@playlist)
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
  
    it "should find the playlist requested" do
      Playlist.should_receive(:find).with("1").and_return(@playlist)
      do_get
    end
  
    it "should assign the found playlist for the view" do
      do_get
      assigns[:playlist].should equal(@playlist)
    end
  end

  describe "handling GET /playlists/1.xml" do

    before(:each) do
      @playlist = mock_model(Playlist, :to_xml => "XML")
      Playlist.stub!(:find).and_return(@playlist)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the playlist requested" do
      Playlist.should_receive(:find).with("1").and_return(@playlist)
      do_get
    end
  
    it "should render the found playlist as xml" do
      @playlist.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /playlists/new" do

    before(:each) do
      @playlist = mock_model(Playlist)
      Playlist.stub!(:new).and_return(@playlist)
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
  
    it "should create an new playlist" do
      Playlist.should_receive(:new).and_return(@playlist)
      do_get
    end
  
    it "should not save the new playlist" do
      @playlist.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new playlist for the view" do
      do_get
      assigns[:playlist].should equal(@playlist)
    end
  end

  describe "handling GET /playlists/1/edit" do

    before(:each) do
      @playlist = mock_model(Playlist)
      Playlist.stub!(:find).and_return(@playlist)
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
  
    it "should find the playlist requested" do
      Playlist.should_receive(:find).and_return(@playlist)
      do_get
    end
  
    it "should assign the found Playlist for the view" do
      do_get
      assigns[:playlist].should equal(@playlist)
    end
  end

  describe "handling POST /playlists" do

    before(:each) do
      @playlist = mock_model(Playlist, :to_param => "1")
      Playlist.stub!(:new).and_return(@playlist)
    end
    
    describe "with successful save" do
  
      def do_post
        @playlist.should_receive(:save).and_return(true)
        post :create, :playlist => {}
      end
  
      it "should create a new playlist" do
        Playlist.should_receive(:new).with({}).and_return(@playlist)
        do_post
      end

      it "should redirect to the new playlist" do
        do_post
        response.should redirect_to(playlist_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @playlist.should_receive(:save).and_return(false)
        post :create, :playlist => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /playlists/1" do

    before(:each) do
      @playlist = mock_model(Playlist, :to_param => "1")
      Playlist.stub!(:find).and_return(@playlist)
    end
    
    describe "with successful update" do

      def do_put
        @playlist.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the playlist requested" do
        Playlist.should_receive(:find).with("1").and_return(@playlist)
        do_put
      end

      it "should update the found playlist" do
        do_put
        assigns(:playlist).should equal(@playlist)
      end

      it "should assign the found playlist for the view" do
        do_put
        assigns(:playlist).should equal(@playlist)
      end

      it "should redirect to the playlist" do
        do_put
        response.should redirect_to(playlist_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @playlist.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /playlists/1" do

    before(:each) do
      @playlist = mock_model(Playlist, :destroy => true)
      Playlist.stub!(:find).and_return(@playlist)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the playlist requested" do
      Playlist.should_receive(:find).with("1").and_return(@playlist)
      do_delete
    end
  
    it "should call destroy on the found playlist" do
      @playlist.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the playlists list" do
      do_delete
      response.should redirect_to(playlists_url)
    end
  end
end
