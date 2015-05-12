class MainController < UIViewController

  def viewDidLoad
    super

    rmq.stylesheet = MainStylesheet
    init_nav
    rmq(self.view).apply_style :root_view

    # Camera button
    @camera_button = rmq.append(UIButton, :camera_button).on(:touch) do
      p "Camera"
    end
  end

  def init_nav
    self.title = '相机的使用'
  end
end
