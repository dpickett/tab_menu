module TabMenu
  class Rails < Rails::Railtie
    ActiveSupport.on_load(:action_controller) do
      require "tab_menu/view_helpers"
      helper TabMenu::ViewHelpers
    end
  end
end
