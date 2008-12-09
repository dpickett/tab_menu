module TabMenu
  class TabBuilder
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::CaptureHelper
    
    def initialize(controller)
      @controller = controller
    end
    
    def tab(name, url, html_options = {})
      #append current to the contentli class attribute if its the current page
      html_options[:class] = [html_options[:class], "current"].join if @controller.current_page?(url)
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