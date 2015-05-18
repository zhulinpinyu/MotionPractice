class AppDelegate < PM::Delegate
  def on_load(app, options)
    @menu = open MenuDrawer
  end

  def show_menu
    @menu.show :left
  end

end
