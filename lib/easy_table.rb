require 'action_view'
require 'active_support/core_ext'
require 'rails/generators'
module EasyTable
  autoload :Config,               'easy_table/config'
  autoload :ActionViewExtension,  'easy_table/action_view_extension'
  autoload :Builder,              'easy_table/builder'
  autoload :Base,                 'easy_table/base'
  autoload :Column,               'easy_table/column'
  autoload :ActionColumn ,       'easy_table/action_column'

  autoload :Presenter,            'easy_table/presenter'

  def self.config
    EasyTable::Config
  end
end

require 'easy_table/engine'
