class HomeScreen < PM::Screen
  title "红色药水"
  stylesheet HomeScreenStylesheet

  def on_load
    set_nav_bar_button :left, system_item: :camera, action: :nav_left_button
    set_nav_bar_button :right, title: "Right", action: :nav_right_button

    @hello_world = append!(UILabel, :hello_world)
  end

  def nav_left_button
    mp 'Left button'
  end

  def nav_right_button
    mp 'Right button'
  end
end
