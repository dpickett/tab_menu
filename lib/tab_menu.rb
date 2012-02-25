require "tab_menu/configuration"
require "tab_menu/rails" if defined?(Rails)

module TabMenu
  def self.configuration
    @configuration ||= TabMenu::Configuration.new
  end
end
