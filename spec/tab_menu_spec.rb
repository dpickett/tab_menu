require 'spec_helper'

describe TabMenu do
  it "has a configuration object" do
    TabMenu.configuration.should be_kind_of(TabMenu::Configuration)
  end

  it "allows me to configure with a block" do
    TabMenu.configure do |config|
      config.active_class = "active"
    end

    TabMenu.configuration.active_class.should eql("active")
  end
end
