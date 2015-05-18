class HomeScreen < PM::Screen
  title "Home"

  def on_load
    set_nav_bar_button :right, title: "Menu", action: :show_menu
  end

  def show_menu
    app_delegate.show_menu
  end

end
