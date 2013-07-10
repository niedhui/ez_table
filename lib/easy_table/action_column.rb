module EasyTable
  class ActionColumn < Column

    def header(table, view)
      ""
    end

    def th_html
      Config.action_th_html
    end

    def td_html
      Config.action_td_html
    end

  end
end
