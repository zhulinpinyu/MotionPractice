class LoginHelpController < UIViewController

  def viewDidLoad
    super
    rmq.stylesheet = LoginHelpControllerStylesheet
    rmq(self.view).apply_style :root_view

    rmq.append(UIView, :reset_password_form).tap do |q|

      q.append(UILabel, :help_label)
      q.append(UILabel, :help_notes_label)
      q.append(UITextField, :email)
      q.append(UIButton, :reset_btn).on(:tap) do |_|
        App.alert "Ok!"
      end
    end
  end
end
