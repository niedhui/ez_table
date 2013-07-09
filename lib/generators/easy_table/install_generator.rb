module EasyTable
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      desc "Create a easy_table initializer"

      def copy_initializer
        template "easy_table.rb", "config/initializers/easy_table.rb"
      end
    end
  end
end
