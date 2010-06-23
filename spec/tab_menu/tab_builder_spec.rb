require File.dirname(__FILE__) + '/../spec_helper'
require 'action_controller'
require 'action_view'
require 'action_view/base'
require 'action_view/template'
require 'action_view/helpers/capture_helper'

require 'net/http'
require 'net/https'

class TabMenuController < ActionController::Base
  include TabMenu
  
  def index
    render :text => "index"
  end
  
  def show
    render :text => "show"
  end
end

describe TabMenu::TabBuilder do
  include TabMenu::ViewHelpers
  
  before(:each) do
    @controller = TabMenuController.new
    self.stub!(:current_page?).and_return(false)
    @builder = TabMenu::TabBuilder.new(self)
  end
  
  it "should create an li" do
    @builder.tab("Test", "/").should =~ /^<li/
    @builder.tab("Test", "/").should =~ /<\/li>$/    
  end
  
  it "should create an li with the first argument as the text" do
    @builder.tab("Test", "/").should =~ />Test</
  end
  
  it "should create an li with a link inside it" do
    @builder.tab("Test", "/").should =~ /<a/
    @builder.tab("Test", "/").should =~ /<\/a>/
  end
  
  it "should create an a with an href to the specified url" do
    @builder.tab("Test", "/").should =~ /href=\"\/\"/
  end
  
  it "should set a tab as current if it is the current url" do
    self.should_receive(:current_page?).with("/").once.and_return true
    @builder.tab("Test", "/").should =~ /class=\"current\"/
  end
end
