require File.dirname(__FILE__) + '/../spec_helper'

require File.dirname(__FILE__) + "/../../lib/tab_menu"

describe TabMenu::ViewHelpers, :type => :helper do
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::TagHelper
  include TabMenu::ViewHelpers
  
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