class HomeScreen < PM::Screen
  title "zhulinpinyu"

  def on_load
    @layout = HomeLayout.new(root: self.view)
    @layout.products_view = products_screen.view
    @layout.build
  end

  def products_screen
    @products_screen ||= begin
      p = ProductsScreen.new
      self.addChildViewController(p)
      p.parent_screen = self
      p
    end
  end

  def select_product(product)
    PM.logger.info(product)
  end

end
