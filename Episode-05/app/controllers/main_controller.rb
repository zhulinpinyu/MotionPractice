class MainController < UIViewController

  def viewDidLoad
    super

    rmq.stylesheet = MainStylesheet
    rmq(self.view).apply_style :root_view

    rmq.append(UIView, :login_form).tap do |q|
      @email = q.append(UITextField, :email).get
      @pwd = q.append(UITextField, :password).get
      q.append(UIButton, :submit_btn).on(:tap) do |_|
        login
      end
    end
  end

  def login
    App.alert "HaHa!"
  end

end
