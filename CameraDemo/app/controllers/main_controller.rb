class MainController < UIViewController

  def viewDidLoad
    super

    rmq.stylesheet = MainStylesheet
    init_nav
    rmq(self.view).apply_style :root_view

    # Create your UIViews here
    @hello_world_label = rmq.append!(UILabel, :hello_world)
  end

  def init_nav
    self.title = '相机的使用'
  end
end
