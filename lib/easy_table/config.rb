module EasyTable
  class Config
    include ActiveSupport::Configurable

    config_accessor :table_html, :tr_html, :th_html, :td_html

  end

end
