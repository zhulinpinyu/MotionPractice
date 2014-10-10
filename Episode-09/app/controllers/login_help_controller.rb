class LoginHelpController < UIViewController

  def viewDidLoad
    super
    rmq.stylesheet = LoginHelpControllerStylesheet
    rmq(self.view).apply_style :root_view

    rmq.append(UIView, :reset_password_form).tap do |q|

      q.append(UILabel, :help_label)
      q.append(UILabel, :help_notes_label)
      @email = q.append(UITextField, :email).get
      q.append(UIButton, :reset_btn).on(:tap) do |_|
        reset_password
      end

      q.append(UILabel, :more_help_label)
      q.append(UIButton, :more_help_note).on(:tap) do |_|
        
      end
    end
  end

  def reset_password
    if submission_invalid?
      handle_invalid_submission
    else
      handle_valid_submission
    end
  end

  def submission_invalid?
    @email.text.blank?
  end

  def handle_valid_submission
    process_reset_password @email.text
  end

  def process_reset_password(email)
    PasswordProcessService.new(self,{email: email}).process
  end

  def handle_reset_password_successful
    App.alert "Email has send to your Inbox."
    self.dismissViewControllerAnimated(true, completion: nil)
  end

  def handle_no_record_found
    App.alert "Your Email Address Invalid."
  end

  def handle_invalid_submission
    App.alert "Enter email address"
  end
end
