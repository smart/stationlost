require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SeasonsController do
  describe "route generation" do

    it "should map { :controller => 'seasons', :action => 'index' } to /seasons" do
      route_for(:controller => "seasons", :action => "index").should == "/seasons"
    end
  
    it "should map { :controller => 'seasons', :action => 'new' } to /seasons/new" do
      route_for(:controller => "seasons", :action => "new").should == "/seasons/new"
    end
  
    it "should map { :controller => 'seasons', :action => 'show', :id => 1 } to /seasons/1" do
      route_for(:controller => "seasons", :action => "show", :id => 1).should == "/seasons/1"
    end
  
    it "should map { :controller => 'seasons', :action => 'edit', :id => 1 } to /seasons/1/edit" do
      route_for(:controller => "seasons", :action => "edit", :id => 1).should == "/seasons/1/edit"
    end
  
    it "should map { :controller => 'seasons', :action => 'update', :id => 1} to /seasons/1" do
      route_for(:controller => "seasons", :action => "update", :id => 1).should == "/seasons/1"
    end
  
    it "should map { :controller => 'seasons', :action => 'destroy', :id => 1} to /seasons/1" do
      route_for(:controller => "seasons", :action => "destroy", :id => 1).should == "/seasons/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'seasons', action => 'index' } from GET /seasons" do
      params_from(:get, "/seasons").should == {:controller => "seasons", :action => "index"}
    end
  
    it "should generate params { :controller => 'seasons', action => 'new' } from GET /seasons/new" do
      params_from(:get, "/seasons/new").should == {:controller => "seasons", :action => "new"}
    end
  
    it "should generate params { :controller => 'seasons', action => 'create' } from POST /seasons" do
      params_from(:post, "/seasons").should == {:controller => "seasons", :action => "create"}
    end
  
    it "should generate params { :controller => 'seasons', action => 'show', id => '1' } from GET /seasons/1" do
      params_from(:get, "/seasons/1").should == {:controller => "seasons", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'seasons', action => 'edit', id => '1' } from GET /seasons/1;edit" do
      params_from(:get, "/seasons/1/edit").should == {:controller => "seasons", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'seasons', action => 'update', id => '1' } from PUT /seasons/1" do
      params_from(:put, "/seasons/1").should == {:controller => "seasons", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'seasons', action => 'destroy', id => '1' } from DELETE /seasons/1" do
      params_from(:delete, "/seasons/1").should == {:controller => "seasons", :action => "destroy", :id => "1"}
    end
  end
end
