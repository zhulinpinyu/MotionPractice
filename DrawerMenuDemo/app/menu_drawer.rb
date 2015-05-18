class MenuDrawer < PM::Menu::Drawer
  def setup
    self.center = HomeScreen.new(nav_bar: true)
    self.left = NavigationScreen.new(nav_bar: true)
    self.to_show = [:pan_bezel, :pan_nav_bar]
    self.to_hide = :all
    self.transition_animation = :slide
    self.max_left_width = 150
    self.shadow = false
  end
end