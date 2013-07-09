module EasyTable
  class ActionsColumn < Column

    def header(table, view)
      ""
    end

    def th_html
      Config.actions_th_html
    end

    def td_html
      Config.actions_td_html
    end

  end
end
