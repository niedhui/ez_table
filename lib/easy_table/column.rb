module EasyTable
  class Column
    attr_reader :name, :options, :value_block

    def initialize(name, options = {}, &block)
      @name, @options, @value_block = name, options, block
    end

    def header(table, view)
      if options[:header].present?
        options[:header]
      elsif table.model_class
        table.model_class.human_attribute_name(name)
      end
    end

    def th_html
      Config.th_html
    end

    def td_html
      Config.td_html
    end

    def value(item, view)
      if value_block
        view.capture(item, &value_block)
      else
        item.send(name)
      end
    end

  end
end
