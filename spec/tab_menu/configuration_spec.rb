require 'spec_helper'

describe TabMenu::Configuration do
  let(:configuration) { TabMenu::Configuration.new }
  it "should default the active class to current" do
    configuration.active_class.should eql("current")
  end

  it "allows me to change the active_class" do
    configuration.active_class = "active"
    configuration.active_class.should eql("active")
  end
end

