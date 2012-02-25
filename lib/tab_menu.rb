require "tab_menu/configuration"
require "tab_menu/rails" if defined?(Rails)

module TabMenu
  def self.configure(&block)
    @configuration = TabMenu::Configuration.new(&block)
  end

  def self.configuration
    @configuration ||= TabMenu::Configuration.new
  end
end
