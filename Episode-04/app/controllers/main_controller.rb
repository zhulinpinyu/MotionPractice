class MainController < UIViewController

  def viewDidLoad
    super

    rmq.stylesheet = MainStylesheet
    rmq(self.view).apply_style :root_view

    rmq.append(UIView, :login_form).tap do |q|
      q.append(UITextField, :email)
      q.append(UITextField, :password)
      q.append(UIButton, :submmit_btn)
    end
  end

end
