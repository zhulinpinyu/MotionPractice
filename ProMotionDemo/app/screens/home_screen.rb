class HomeScreen < PM::Screen
  title "Home"

  def on_load
    @layout = HomeLayout.new(root: self.view).build
  end

end
