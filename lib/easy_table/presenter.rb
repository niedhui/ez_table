module EasyTable
  class Presenter
    attr_reader :view, :table
    delegate :content_tag, to: :view

    def initialize(table)
      @table = table
      @view = table.view
    end

    def render
      content_tag("table", class: 'easy-table') do
        trs = "".html_safe
        trs += render_header
        trs += render_body
      end
    end

    def render_header
      content_tag("tr") do
        ths = "".html_safe
        table.attributes.each do |attr|
          ths += content_tag("th", attr)
        end
        ths
      end
    end

    def render_body
      tbodys = "".html_safe
      table.items.each do |item|
        tbodys += content_tag("tr") do
          tds = "".html_safe
          table.attributes.each do |attr|
            tds += content_tag("td", item.send(attr))
          end
          tds
        end
      end
      tbodys
    end

  end
end
