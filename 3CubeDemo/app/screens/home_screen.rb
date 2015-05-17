class HomeScreen < PM::Screen
  title "Home"

  def on_load
    set_nav_bar_button :left, title: "About", action: :open_about_screen
    set_nav_bar_button :right, title: "Table", action: :open_list_screen
  end

  def will_appear
    set_attributes(self.view,{
      background_color: hex_color("#FFFFFF")
    })

    add(UILabel.new, {
      text: "ProMotion Learn Code",
      frame: [[50,200], [300,30]],
      font: UIFont.systemFontOfSize(26),
      text_alignment: NSTextAlignmentCenter,
    })
  end

  def open_about_screen
    #open_modal AboutScreen.new(nav_bar: true)
    open AboutScreen.new(nav_bar: true)
  end

  def open_list_screen
    open_modal ListScreen.new(nav_bar: true)
  end
end