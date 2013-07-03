module EasyTable
  module ActionViewExtension
    def easy_table_for(objects, options={}, &block)
      EasyTable::Builder.build(objects, self, options) do |table|
        yield table
      end.to_s
    end
  end
end
