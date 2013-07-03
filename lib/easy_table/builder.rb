module EasyTable
  class Builder
    def self.build(items, view, options = {})
      table = Base.new(items, view)
      yield table if block_given?
      table.render
    end
  end
end
