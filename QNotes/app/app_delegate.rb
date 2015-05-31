class AppDelegate < PM::Delegate

  status_bar true, animation: :fade

  def on_load(app, options)
    open_tab_bar HomeScreen.new(nav_bar: true),NewNoteScreen.new
  end
end
