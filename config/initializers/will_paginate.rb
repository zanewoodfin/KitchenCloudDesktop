module WillPaginate
  module ActionView
    def will_paginate(collection=nil, options={})
      options[:renderer] ||= ListLinkRenderer
      super.try :html_safe
    end

    class ListLinkRenderer < LinkRenderer

    protected

      def page_number(page)
        unless page == current_page
          tag(:li, link(page, page, rel: rel_value(page)))
        else
          tag(:li, link(page, page, rel: rel_value(page)), class: "active")
        end
      end

      def previous_or_next_page(page, text, classname)
        if page && classname == 'next_page'
          tag :li,
            link(@template.image_tag('brown-next-arrow.png',
               width: '8',
               height: '10',
               border: '0',
               alt: 'next'),
            page),
            class: classname
        end
#        else
#          tag(:li, text, :class => classname + ' disabled')
#        end
      end

      def html_container(html)
        tag(:ul, html, container_attributes)
      end
    end
  end
end
