require 'spec_helper'

describe TabMenu do
  it "has a configuration object" do
    TabMenu.configuration.should be_kind_of(TabMenu::Configuration)
  end
end
