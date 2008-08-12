require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PlaylistsController do
  describe "route generation" do

    it "should map { :controller => 'playlists', :action => 'index' } to /playlists" do
      route_for(:controller => "playlists", :action => "index").should == "/playlists"
    end
  
    it "should map { :controller => 'playlists', :action => 'new' } to /playlists/new" do
      route_for(:controller => "playlists", :action => "new").should == "/playlists/new"
    end
  
    it "should map { :controller => 'playlists', :action => 'show', :id => 1 } to /playlists/1" do
      route_for(:controller => "playlists", :action => "show", :id => 1).should == "/playlists/1"
    end
  
    it "should map { :controller => 'playlists', :action => 'edit', :id => 1 } to /playlists/1/edit" do
      route_for(:controller => "playlists", :action => "edit", :id => 1).should == "/playlists/1/edit"
    end
  
    it "should map { :controller => 'playlists', :action => 'update', :id => 1} to /playlists/1" do
      route_for(:controller => "playlists", :action => "update", :id => 1).should == "/playlists/1"
    end
  
    it "should map { :controller => 'playlists', :action => 'destroy', :id => 1} to /playlists/1" do
      route_for(:controller => "playlists", :action => "destroy", :id => 1).should == "/playlists/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'playlists', action => 'index' } from GET /playlists" do
      params_from(:get, "/playlists").should == {:controller => "playlists", :action => "index"}
    end
  
    it "should generate params { :controller => 'playlists', action => 'new' } from GET /playlists/new" do
      params_from(:get, "/playlists/new").should == {:controller => "playlists", :action => "new"}
    end
  
    it "should generate params { :controller => 'playlists', action => 'create' } from POST /playlists" do
      params_from(:post, "/playlists").should == {:controller => "playlists", :action => "create"}
    end
  
    it "should generate params { :controller => 'playlists', action => 'show', id => '1' } from GET /playlists/1" do
      params_from(:get, "/playlists/1").should == {:controller => "playlists", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'playlists', action => 'edit', id => '1' } from GET /playlists/1;edit" do
      params_from(:get, "/playlists/1/edit").should == {:controller => "playlists", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'playlists', action => 'update', id => '1' } from PUT /playlists/1" do
      params_from(:put, "/playlists/1").should == {:controller => "playlists", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'playlists', action => 'destroy', id => '1' } from DELETE /playlists/1" do
      params_from(:delete, "/playlists/1").should == {:controller => "playlists", :action => "destroy", :id => "1"}
    end
  end
end
