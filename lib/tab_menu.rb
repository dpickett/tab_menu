require "tab_menu/tab_builder"
require "tab_menu/view_helpers"

module TabMenu
  def self.enable
    ActionView::Base.send :include, TabMenu::ViewHelpers
  end
end

#thanks will_paginate for this snippet
if defined?(Rails) and defined?(ActionController)
  TabMenu.enable
end