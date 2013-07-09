module EasyTable
  class Config
    include ActiveSupport::Configurable

    config_accessor :table_html, :tr_html, :th_html, :td_html, :actions_th_html, :actions_td_html

  end

end
