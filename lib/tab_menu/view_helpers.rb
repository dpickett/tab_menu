require File.dirname(__FILE__) + '/tab_builder'

module TabMenu
  module ViewHelpers
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::UrlHelper
    
    def tab_menu(tab_name = "", html_options = {}, options = {}, &block)
      html_options[:class] ||= tab_name.blank? ? nil : tab_name.gsub(" ", "_").underscore
      html_option_strings = []
      html_options.each do |key, value|
        html_option_strings << "#{key}=\"#{value}\""
      end

      concat("<ul #{html_option_strings.join}>")
      yield(TabBuilder.new(self, options[:current_tab]))
      concat("</ul>")
    end
    
  end
end
