module EasyTable
  class Base
    attr_reader :attributes, :view, :items, :presenter
    delegate :render, to: :presenter

    def initialize(items, view, presenter = nil)
      @items, @view = items, view
      @attributes = []
      @presenter = presenter || Presenter.new(self)
    end

    def td(attribute)
      @attributes << attribute
    end



  end
end
