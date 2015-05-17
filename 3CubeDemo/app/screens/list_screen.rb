class ListScreen < PM::TableScreen
  
  title "List"
  searchable(placeholder: "Search cell")
  refreshable(callback: :on_refresh,
              pull_message: "下拉刷新",
              refreshing: "正在获取数据...",
              update_format: "上次更新：%s",
              update_time_format: "%l:%M %p"
  )

  def on_load
    set_nav_bar_button :right, title: "X", action: :close
  end

  def table_data
    [{
      cells: (1..60).map do |i|
        {
          title: "mlx #{i}",
          subtitle: "simple text #{i}",
          action: :details,
          arguments: {index: i}
        }
      end
      }]
  end

  def details(arg)
    open DetailScreen.new(index: arg[:index])
  end

  def on_refresh
    end_refreshing
  end
end