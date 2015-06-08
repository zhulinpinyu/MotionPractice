class HomeScreen < PM::Screen
  title "Tasker"
  stylesheet HomeScreenStylesheet

  def on_load
    set_nav_bar_button :right, system_item: :add, action: :add_task

    @hello_world = append!(UILabel, :hello_world)
  end

  def add_task
    mp 'Add Task'
  end

  # You don't have to reapply styles to all UIViews, if you want to optimize, another way to do it
  # is tag the views you need to restyle in your stylesheet, then only reapply the tagged views, like so:
  #   def logo(st)
  #     st.frame = {t: 10, w: 200, h: 96}
  #     st.centered = :horizontal
  #     st.image = image.resource('logo')
  #     st.tag(:reapply_style)
  #   end
  #
  # Then in will_animate_rotate
  #   find(:reapply_style).reapply_styles#

  # Remove the following if you're only using portrait
  def will_animate_rotate(orientation, duration)
    find.all.reapply_styles
  end
end
