module EasyTable
  class Presenter
    attr_reader :view, :table
    delegate :content_tag, to: :view

    def initialize(table, view)
      @table, @view = table, view
    end

    def render
      content_tag("table", Config.table_html) do
        trs = "".html_safe
        trs += render_header
        trs += render_body
      end
    end

    def render_header
      content_tag("thead") do
        content_tag("tr") do
          ths = "".html_safe
          table.all_columns.each do |column|
            ths += content_tag("th", column.header(table, view))
          end
          ths
        end
      end
    end

    def render_body
      content_tag("tbody") do
        tbodys = "".html_safe
        table.items.each do |item|
          tbodys += content_tag("tr") do
            tds = "".html_safe
            table.all_columns.each do |column|
              tds += content_tag("td", column.value(item, view))
            end
            tds
          end
        end
        tbodys
      end
    end

  end
end
