module EasyTable
  class Base
    attr_reader :columns, :items, :options, :model_class, :actions_column
    attr_accessor :presenter

    delegate :render, to: :presenter

    # options:
    #   model_class: the class of the model, used for i18n, using with the human_attribute_name
    def initialize(items, options = {})
      @items = items
      @options = options
      @columns = []
      process_options
    end

    def td(name, options = {}, &block)
      @columns << Column.new(name, options, &block)
    end

    def actions(&block)
      @actions_column = ActionsColumn.new("", {}, &block)
    end

    def all_columns
      @all_columns ||= (columns + [@actions_column]).compact
    end

    # TODO guess model_class from rails controller, should in ActionViewExtension
    def process_options
      @model_class = options[:model_class] || NilModelClass.instance
    end

    class NilModelClass
      include Singleton
      def human_attribute_name(attribute)
        attribute
      end
    end

  end
end
