module TabMenu
  class Configuration
    def initialize
      @active_class = "current"
    end

    def active_class
      @active_class
    end

    def active_class=(css_class)
      @active_class = css_class
    end
  end
end
