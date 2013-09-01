module EasyTable
  class Base
    attr_reader :columns, :items, :options, :model_class, :action_columns
    attr_accessor :presenter

    delegate :render, to: :presenter

    # options:
    #   model_class: the class of the model, used for i18n, using with the human_attribute_name
    def initialize(items, options = {})
      @items          = items
      @options        = options
      @columns        = []
      @action_columns = []
      process_options
    end

    def tds(*names)
      names.each { |name| td(name) }
    end

    # TODO: spec & doc for using option
    def td(name, options = {}, &block)
      column_class = options[:using] || Column
      @columns << column_class.new(name, options, &block)
    end

    def action(&block)
      @action_columns << ActionColumn.new("", {}, &block)
    end

    def all_columns
      @all_columns ||= (columns + action_columns)
    end

    def process_options
      @model_class = options[:model_class] || NilModelClass.instance
    end

    class NilModelClass
      include Singleton
      def human_attribute_name(attribute)
        attribute.to_s
      end
    end

  end
end
