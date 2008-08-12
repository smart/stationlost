require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ClipsController do
  describe "handling GET /clips" do

    before(:each) do
      @clip = mock_model(Clip)
      Clip.stub!(:find).and_return([@clip])
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
  
    it "should find all clips" do
      Clip.should_receive(:find).with(:all).and_return([@clip])
      do_get
    end
  
    it "should assign the found clips for the view" do
      do_get
      assigns[:clips].should == [@clip]
    end
  end

  describe "handling GET /clips.xml" do

    before(:each) do
      @clips = mock("Array of Clips", :to_xml => "XML")
      Clip.stub!(:find).and_return(@clips)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all clips" do
      Clip.should_receive(:find).with(:all).and_return(@clips)
      do_get
    end
  
    it "should render the found clips as xml" do
      @clips.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /clips/1" do

    before(:each) do
      @clip = mock_model(Clip)
      Clip.stub!(:find).and_return(@clip)
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
  
    it "should find the clip requested" do
      Clip.should_receive(:find).with("1").and_return(@clip)
      do_get
    end
  
    it "should assign the found clip for the view" do
      do_get
      assigns[:clip].should equal(@clip)
    end
  end

  describe "handling GET /clips/1.xml" do

    before(:each) do
      @clip = mock_model(Clip, :to_xml => "XML")
      Clip.stub!(:find).and_return(@clip)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the clip requested" do
      Clip.should_receive(:find).with("1").and_return(@clip)
      do_get
    end
  
    it "should render the found clip as xml" do
      @clip.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /clips/new" do

    before(:each) do
      @clip = mock_model(Clip)
      Clip.stub!(:new).and_return(@clip)
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
  
    it "should create an new clip" do
      Clip.should_receive(:new).and_return(@clip)
      do_get
    end
  
    it "should not save the new clip" do
      @clip.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new clip for the view" do
      do_get
      assigns[:clip].should equal(@clip)
    end
  end

  describe "handling GET /clips/1/edit" do

    before(:each) do
      @clip = mock_model(Clip)
      Clip.stub!(:find).and_return(@clip)
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
  
    it "should find the clip requested" do
      Clip.should_receive(:find).and_return(@clip)
      do_get
    end
  
    it "should assign the found Clip for the view" do
      do_get
      assigns[:clip].should equal(@clip)
    end
  end

  describe "handling POST /clips" do

    before(:each) do
      @clip = mock_model(Clip, :to_param => "1")
      Clip.stub!(:new).and_return(@clip)
    end
    
    describe "with successful save" do
  
      def do_post
        @clip.should_receive(:save).and_return(true)
        post :create, :clip => {}
      end
  
      it "should create a new clip" do
        Clip.should_receive(:new).with({}).and_return(@clip)
        do_post
      end

      it "should redirect to the new clip" do
        do_post
        response.should redirect_to(clip_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @clip.should_receive(:save).and_return(false)
        post :create, :clip => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /clips/1" do

    before(:each) do
      @clip = mock_model(Clip, :to_param => "1")
      Clip.stub!(:find).and_return(@clip)
    end
    
    describe "with successful update" do

      def do_put
        @clip.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the clip requested" do
        Clip.should_receive(:find).with("1").and_return(@clip)
        do_put
      end

      it "should update the found clip" do
        do_put
        assigns(:clip).should equal(@clip)
      end

      it "should assign the found clip for the view" do
        do_put
        assigns(:clip).should equal(@clip)
      end

      it "should redirect to the clip" do
        do_put
        response.should redirect_to(clip_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @clip.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /clips/1" do

    before(:each) do
      @clip = mock_model(Clip, :destroy => true)
      Clip.stub!(:find).and_return(@clip)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the clip requested" do
      Clip.should_receive(:find).with("1").and_return(@clip)
      do_delete
    end
  
    it "should call destroy on the found clip" do
      @clip.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the clips list" do
      do_delete
      response.should redirect_to(clips_url)
    end
  end
end
