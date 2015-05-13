class MainController < UIViewController

  def viewDidLoad
    super

    rmq.stylesheet = MainStylesheet
    self.title = 'CDQ 使用'
    rmq(self.view).apply_style :root_view

    # Create your UIViews here
    rmq.append(UILabel, :name_label)
    @name = rmq.append(UITextField, :name_field).focus.get
    rmq.append(UIButton, :save_button).on(:touch) do
      p @name.text
    end
  end

end