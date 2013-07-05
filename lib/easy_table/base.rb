module EasyTable
  class Base
    attr_reader :attributes, :items, :options, :model_class
    attr_accessor :presenter

    delegate :render, to: :presenter

    # options:
    #   model_class: the class of the model, used for i18n, using with the human_attribute_name
    def initialize(items, options = {})
      @items = items
      @options = options
      @attributes = []
      process_options
    end

    def td(attribute)
      @attributes << attribute
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
