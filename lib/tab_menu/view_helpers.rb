require File.dirname(__FILE__) + '/tab_builder'

module TabMenu
  module ViewHelpers
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::UrlHelper
    include ActionView::Helpers::CaptureHelper
    
    def tab_menu(tab_name = "", html_options = {}, options = {}, &block)
      html_options[:class] ||= tab_name.blank? ? nil : tab_name
      
      content_tag(:ul, html_options) do
        yield(TabBuilder.new(self, options[:current_tab]))
      end
    end
    
  end
end
