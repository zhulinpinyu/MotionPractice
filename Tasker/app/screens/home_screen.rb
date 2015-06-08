class HomeScreen < PM::TableScreen
  title "Tasker"
  stylesheet HomeScreenStylesheet

  def on_load
    init_nav

    @hello_world = append!(UILabel, :hello_world)
  end

  def table_data
    []
  end

  def add_task
    open_modal TaskScreen.new(nav_bar: true,
      transition_style: UIModalTransitionStyleFlipHorizontal,
      presentation_style: UIModalPresentationFormSheet
    )
  end

  def init_nav
    set_nav_bar_button :right, system_item: :add, action: :add_task
  end
end
