module EasyTable
  class Builder
    def self.build(items, view, options = {})
      table = Base.new(items, options)
      yield table if block_given?
      table.presenter = Presenter.new(table, view)
      table.render
    end
  end
end
