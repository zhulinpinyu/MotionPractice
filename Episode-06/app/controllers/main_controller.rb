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
    if submission_invalid?
      handle_submission_invalid
    else
      handle_submission_valid
    end
  end

  def submission_invalid?
    @email.text.blank? || @pwd.text.blank?
  end

  def handle_submission_invalid
    App.alert "邮箱或密码有误，请重新输入"
  end

  def handle_submission_valid
    App.alert "Good!"
  end

end
