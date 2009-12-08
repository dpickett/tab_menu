require File.dirname(__FILE__) + '/tab_builder'

module TabMenu
  module ViewHelpers
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::UrlHelper
    
    def tab_menu(tab_name = "", html_options = {}, options = {}, &block)
      html_options[:class] ||= tab_name.blank? ? nil : tab_name
      
      content_tag(:ul, yield(TabBuilder.new(self, options[:current_tab])), html_options)
    end
    
  end
end
