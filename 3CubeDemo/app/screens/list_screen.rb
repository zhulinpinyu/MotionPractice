class ListScreen < PM::TableScreen
  title "List"

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
    p arg[:index]
  end

end