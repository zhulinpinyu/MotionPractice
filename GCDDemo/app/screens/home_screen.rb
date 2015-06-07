class HomeScreen < PM::Screen
  title "多线程技术"
  stylesheet HomeScreenStylesheet

  def on_load
    init_nav
    @hello_world = append!(UILabel, :hello_world)
  end

  def init_nav
    set_nav_bar_button :left, system_item: :camera, action: :nav_left_button
    set_nav_bar_button :right, title: "→", action: :nav_right_button
  end

  def nav_left_button
    mp "Left"
  end

  def nav_right_button
    mp "Right"
  end
end
