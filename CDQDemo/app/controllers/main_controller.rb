class MainController < UIViewController

  def viewDidLoad
    super

    rmq.stylesheet = MainStylesheet
    self.title = 'CDQ 使用'
    rmq(self.view).apply_style :root_view

    # Create your UIViews here
    @hello_world_label = rmq.append!(UILabel, :hello_world)
  end

end