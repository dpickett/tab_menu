module TabMenu
  class Configuration
    def initialize(&block)
      @active_class = "current"
      instance_eval(&block) if block_given?
    end

    def active_class
      @active_class
    end

    def active_class=(css_class)
      @active_class = css_class
    end
  end
end
