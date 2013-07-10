module EasyTable
  class Config
    include ActiveSupport::Configurable

    config_accessor :table_html, :tr_html, :th_html, :td_html, :action_th_html, :action_td_html

  end

end
