require File.dirname(__FILE__) + '/tab_builder'

module TabMenu
  module ViewHelpers
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::UrlHelper
    
    def tab_menu(tab_name = "", html_options = {}, &block)
      html_options[:class] ||= tab_name.blank? ? nil : tab_name.gsub(" ", "_").underscore
      html_option_strings = []
      html_options.each do |key, value|
        html_option_strings << "#{key}=\"#{value}\""
      end
      
      # unsure of performance here but nested content_tags were causing issues refer to - 
      # refer to - http://rails.lighthouseapp.com/projects/8994/tickets/386-nested-content_tag-calls-causes-the-layout-to-render-multiple-times
      # will fix in 2.2 after double render gets fixed
      if eval("defined? _erbout", block.binding)
        concat("<ul #{html_option_strings.join}>", block.binding)
        yield(TabBuilder.new(self))
        concat("</ul>", block.binding)
      else
        content_tag(:ul, html_options) do 
          yield(TabBuilder.new(self))
        end
      end

    end
    
  end
end
