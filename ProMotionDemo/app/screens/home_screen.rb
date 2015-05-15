class HomeScreen < PM::Screen
  title "zhulinpinyu"

  def on_load
    @layout = HomeLayout.new(root: self.view).build
  end

end
