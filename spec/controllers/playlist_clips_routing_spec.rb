require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PlaylistClipsController do
  describe "route generation" do

    it "should map { :controller => 'playlist_clips', :action => 'index' } to /playlist_clips" do
      route_for(:controller => "playlist_clips", :action => "index").should == "/playlist_clips"
    end
  
    it "should map { :controller => 'playlist_clips', :action => 'new' } to /playlist_clips/new" do
      route_for(:controller => "playlist_clips", :action => "new").should == "/playlist_clips/new"
    end
  
    it "should map { :controller => 'playlist_clips', :action => 'show', :id => 1 } to /playlist_clips/1" do
      route_for(:controller => "playlist_clips", :action => "show", :id => 1).should == "/playlist_clips/1"
    end
  
    it "should map { :controller => 'playlist_clips', :action => 'edit', :id => 1 } to /playlist_clips/1/edit" do
      route_for(:controller => "playlist_clips", :action => "edit", :id => 1).should == "/playlist_clips/1/edit"
    end
  
    it "should map { :controller => 'playlist_clips', :action => 'update', :id => 1} to /playlist_clips/1" do
      route_for(:controller => "playlist_clips", :action => "update", :id => 1).should == "/playlist_clips/1"
    end
  
    it "should map { :controller => 'playlist_clips', :action => 'destroy', :id => 1} to /playlist_clips/1" do
      route_for(:controller => "playlist_clips", :action => "destroy", :id => 1).should == "/playlist_clips/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'playlist_clips', action => 'index' } from GET /playlist_clips" do
      params_from(:get, "/playlist_clips").should == {:controller => "playlist_clips", :action => "index"}
    end
  
    it "should generate params { :controller => 'playlist_clips', action => 'new' } from GET /playlist_clips/new" do
      params_from(:get, "/playlist_clips/new").should == {:controller => "playlist_clips", :action => "new"}
    end
  
    it "should generate params { :controller => 'playlist_clips', action => 'create' } from POST /playlist_clips" do
      params_from(:post, "/playlist_clips").should == {:controller => "playlist_clips", :action => "create"}
    end
  
    it "should generate params { :controller => 'playlist_clips', action => 'show', id => '1' } from GET /playlist_clips/1" do
      params_from(:get, "/playlist_clips/1").should == {:controller => "playlist_clips", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'playlist_clips', action => 'edit', id => '1' } from GET /playlist_clips/1;edit" do
      params_from(:get, "/playlist_clips/1/edit").should == {:controller => "playlist_clips", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'playlist_clips', action => 'update', id => '1' } from PUT /playlist_clips/1" do
      params_from(:put, "/playlist_clips/1").should == {:controller => "playlist_clips", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'playlist_clips', action => 'destroy', id => '1' } from DELETE /playlist_clips/1" do
      params_from(:delete, "/playlist_clips/1").should == {:controller => "playlist_clips", :action => "destroy", :id => "1"}
    end
  end
end
