require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ClipsController do
  describe "route generation" do

    it "should map { :controller => 'clips', :action => 'index' } to /clips" do
      route_for(:controller => "clips", :action => "index").should == "/clips"
    end
  
    it "should map { :controller => 'clips', :action => 'new' } to /clips/new" do
      route_for(:controller => "clips", :action => "new").should == "/clips/new"
    end
  
    it "should map { :controller => 'clips', :action => 'show', :id => 1 } to /clips/1" do
      route_for(:controller => "clips", :action => "show", :id => 1).should == "/clips/1"
    end
  
    it "should map { :controller => 'clips', :action => 'edit', :id => 1 } to /clips/1/edit" do
      route_for(:controller => "clips", :action => "edit", :id => 1).should == "/clips/1/edit"
    end
  
    it "should map { :controller => 'clips', :action => 'update', :id => 1} to /clips/1" do
      route_for(:controller => "clips", :action => "update", :id => 1).should == "/clips/1"
    end
  
    it "should map { :controller => 'clips', :action => 'destroy', :id => 1} to /clips/1" do
      route_for(:controller => "clips", :action => "destroy", :id => 1).should == "/clips/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'clips', action => 'index' } from GET /clips" do
      params_from(:get, "/clips").should == {:controller => "clips", :action => "index"}
    end
  
    it "should generate params { :controller => 'clips', action => 'new' } from GET /clips/new" do
      params_from(:get, "/clips/new").should == {:controller => "clips", :action => "new"}
    end
  
    it "should generate params { :controller => 'clips', action => 'create' } from POST /clips" do
      params_from(:post, "/clips").should == {:controller => "clips", :action => "create"}
    end
  
    it "should generate params { :controller => 'clips', action => 'show', id => '1' } from GET /clips/1" do
      params_from(:get, "/clips/1").should == {:controller => "clips", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'clips', action => 'edit', id => '1' } from GET /clips/1;edit" do
      params_from(:get, "/clips/1/edit").should == {:controller => "clips", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'clips', action => 'update', id => '1' } from PUT /clips/1" do
      params_from(:put, "/clips/1").should == {:controller => "clips", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'clips', action => 'destroy', id => '1' } from DELETE /clips/1" do
      params_from(:delete, "/clips/1").should == {:controller => "clips", :action => "destroy", :id => "1"}
    end
  end
end
