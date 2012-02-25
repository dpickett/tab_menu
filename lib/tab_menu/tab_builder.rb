module TabMenu
  class TabBuilder
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::CaptureHelper
    
    attr_accessor :output_buffer
    def initialize(controller, current_tab = nil)
      @controller = controller
      @current_tab = current_tab
    end
    
    def tab(name, url, li_html_options = {}, link_to_options = {})
      #append current to the contentli class attribute if its the current page
      if (!@current_tab.nil? && @current_tab.downcase == name.downcase) || (@current_tab.nil? && @controller.current_page?(url))
        li_html_options[:class] = [li_html_options[:class], configuration.active_class].join(" ").strip()
      end
      
      content_tag(:li, name, li_html_options) do
        @controller.link_to name, url, link_to_options
      end
    end

    protected
    def configuration
      TabMenu.configuration
    end
  end
end
