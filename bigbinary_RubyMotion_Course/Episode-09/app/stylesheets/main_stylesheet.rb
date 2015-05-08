class MainStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.brown
  end

  def email(st)
    st.frame = {left: 10, top: 70, width: 180, height: 30, centered: :horizontal}
    st.font = font.small
    st.background_color = color.white
    st.view.tap do |view|
      view.placeholder = "Email"
      view.clearButtonMode = UITextFieldViewModeWhileEditing
      view.keyboardType = UIKeyboardTypeEmailAddress
      view.borderStyle = UITextBorderStyleRoundedRect
      view.autocorrectionType = UITextAutocorrectionTypeNo
    end
  end

  def password(st)
    st.frame = {left: 10, top: 110, width: 180, height: 30, centered: :horizontal}
    st.font = font.small
    st.background_color = color.white
    st.view.tap do |view|
      view.placeholder = "Password"
      view.clearButtonMode = UITextFieldViewModeWhileEditing
      st.view.setSecureTextEntry(true)
      view.borderStyle = UITextBorderStyleRoundedRect
      view.autocorrectionType = UITextAutocorrectionTypeNo
    end
  end

  def submit_btn(st)
    st.frame = {left: 10, top: 150, width: 180, height: 30, centered: :horizontal}
    st.font = font.small
    st.color = color.white
    st.background_color = color.tint_color
    st.text = 'Login'
  end

  def login_help_label(st)
    st.frame = {left: 10, top: 180, width: 45, height: 30}
    st.font = font.xsmall
    st.color = color.black
    st.text = 'Help:'
  end

  def login_help_btn(st)
    st.frame = {left: 55, top: 180, width: 90, height: 30}
    st.height = 30
    st.font = font.xsmall
    st.color = color.tint_color
    st.view.titleLabel.lineBreakMode = NSLineBreakByWordWrapping
    st.view.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter
    st.text = '找回密码。'
  end

  def login_form(st)
    st.frame = {top: 30, width: 200, height: 250, centered: :horizontal}
  end

end
