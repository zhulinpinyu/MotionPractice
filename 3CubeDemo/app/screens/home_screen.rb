class HomeScreen < PM::Screen
  title "Home"

  def on_load
    #set_nav_bar_button :right, title: "About", action: open_about_screen
  end

  def will_appear
    set_attributes(self.view,{
      background_color: hex_color("#FFFFFF")
    })
  end
end