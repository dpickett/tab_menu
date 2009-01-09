require File.dirname(__FILE__) + '/../spec_helper'

require File.dirname(__FILE__) + "/../../lib/tab_menu"

describe TabMenu::ViewHelpers, "helper" do
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::TagHelper
  include TabMenu::ViewHelpers
  
  attr_accessor :output_buffer
  
  before(:each) do
    self.output_buffer = ""
    self.stub!(:current_page?).and_return(false)
  end
  
  it "should create an unordered list" do
    menu = tab_menu do |t|
      t.tab "Test", "/"
    end
    
    menu.should =~ /^<ul/
    menu.should =~ /<\/ul>$/
  end
  
  it "should optionally take a name which will create a subsequent class for the ul" do
    menu = tab_menu("test") do |t|
      t.tab "Test", "/"
    end
    
    menu.should =~ /<ul class=\"test\">/
  end
end

describe TabMenu::ViewHelpers, "erb", :type => :helper do
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::TagHelper
  include TabMenu::ViewHelpers
  
  before(:each) do
    pending("must figure out how to mock definition of erbout - is this worth it with defect fix pending?")
  end
  
  it "should create an unordered list" do
    menu = helper.tab_menu do |t|
      t.tab "Test", "/"
    end
    
    menu.should =~ /^<ul>/
    menu.should =~ /<\/ul>$/
  end
  
  it "should optionally take a name which will create a subsequent class for the ul" do
    menu = tab_menu("test") do |t|
      t.tab "Test", "/"
    end
    
    menu.should =~ /<ul class=\"test\">/
  end
end
