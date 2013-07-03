module EasyTable
  module ActionViewExtension
    def easy_table_for(objects, options={})
      EasyTable::Builder.build(objects, self, options) do |table|
        yield table if block_given?
      end.to_s
    end
  end
end
