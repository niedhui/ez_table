module EasyTable
  module ActionViewExtension
    def easy_table_for(objects, options = {})
      options[:model_class] ||= guess_model_class

      EasyTable::Builder.build(objects, self, options) do |table|
        yield table if block_given?
      end.to_s
    end

    # TODO: support namespace
    def guess_model_class
      controller_name.classify.constantize
    rescue
      nil
    end
  end
end
