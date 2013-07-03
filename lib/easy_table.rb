require 'action_view'
require 'active_support/core_ext'
module EasyTable
  autoload :Config,               'easy_table/config'
  autoload :ActionViewExtension,  'easy_table/action_view_extension'
  autoload :Builder,              'easy_table/builder'
  autoload :Base,                 'easy_table/base'
  module Generators
    autoload :InstallGenerator, 'easy_table/generators/install_generator'
  end
end

require 'easy_table/engine'
