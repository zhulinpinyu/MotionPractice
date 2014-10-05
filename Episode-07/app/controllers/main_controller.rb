class MainController < UIViewController

  def viewDidLoad
    super

    rmq.stylesheet = MainStylesheet
    rmq(self.view).apply_style :root_view

    rmq.append(UIView, :login_form).tap do |q|
      @email = q.append(UITextField, :email).get
      @password = q.append(UITextField, :password).get
      q.append(UIButton, :submit_btn).on(:tap) do |_|
        login
      end
      q.append(UILabel, :login_help_label)
      q.append(UIButton, :login_help_btn).on(:tap) do |_|
        App.alert "点我，点我"
      end
    end
  end

  def login
    if invalid_submission?
      handle_invalid_submission
    else
      handle_valid_submission
    end
  end

  def invalid_submission?
    @email.text.blank? || @password.text.blank?
  end

  def handle_invalid_submission
    App.alert "邮箱或密码有误，请重新输入"
  end

  def handle_valid_submission
    process_authentication @email.text, App::Persistence['device_token'], @password.text
  end

  def process_authentication(email, device_token, password)
    AuthenticationService.new(self, {email: email, device_token: device_token, password: password}).process
  end

  def handle_login_successful
    App.alert "Login Successful, Welcome!"
  end

  def handle_login_failed
    App.alert "Sorry,Login failed."
  end

end
