require File.dirname(__FILE__) + '/tab_builder'

module TabMenu
  module ViewHelpers
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::UrlHelper
    
    def block_comp(pre,pos,&block)
      content=concat(pre)
      yield(TabBuilder.new(self))
      content << pos
    end
    
    def tab_menu(tab_name = "", html_options = {}, &block)
      html_options[:class] ||= tab_name.blank? ? nil : tab_name.gsub(" ", "_").underscore
      html_option_strings = []
      html_options.each do |key, value|
        html_option_strings << "#{key}=\"#{value}\""
      end

      block_comp("<ul #{html_option_strings.join}>", "</ul>", &block)
    end
    
  end
end
