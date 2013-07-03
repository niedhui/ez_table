module EasyTable
  class Base
    attr_reader :attributes, :view, :items
    delegate :content_tag, to: :view

    def initialize(items, view)
      @items, @view = items, view
      @attributes = []
    end

    def td(attribute)
      @attributes << attribute
    end

    def render
      content_tag("table") do
        trs = "".html_safe
        trs += render_header
        trs += render_body
      end
    end

    def render_header
      content_tag("tr") do
        ths = "".html_safe
        attributes.each do |attr|
          ths += content_tag("th", attr)
        end
        ths
      end
    end

    def render_body
      tbodys = "".html_safe
      items.each do |item|
        tbodys += content_tag("tr") do
          tds = "".html_safe
          attributes.each do |attr|
            tds += content_tag("td", item.send(attr))
          end
          tds
        end
      end
      tbodys
    end

  end
end
