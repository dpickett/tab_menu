module TabMenu
  class TabBuilder
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::CaptureHelper
    
    def initialize(controller, current_tab = nil)
      @controller = controller
      @current_tab = current_tab
    end
    
    def tab(name, url, html_options = {})
      #append current to the contentli class attribute if its the current page
      if (!@current_tab.nil? && @current_tab.downcase == name.downcase) || (@current_tab.nil? && @controller.current_page?(url))
        html_options[:class] = [html_options[:class], "current"].join(" ").strip()
      end
      
      content_tag(:li, name, html_options) do
        @controller.link_to name, url
      end
    end

    # hack for rails 2.2.2
    def with_output_buffer(lines=[], &block)
      block.call
    end
    
  end
end