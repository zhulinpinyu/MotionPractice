class LoginHelpControllerStylesheet < ApplicationStylesheet
  # Add your view stylesheets here. You can then override styles if needed, example:
  # include FooStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.battleship_gray
  end

  def reset_password_form(st)
    st.frame = {w: 200, h: 370}
    st.centered = :both
  end

  def help_label(st)
    st.frame = {l: 0, t: 100, w: 180, h: 30}
    st.font = font.xsmall
    st.color = color.black
    st.text = 'Reset your password:'
  end

  def help_notes_label(st)
    st.frame = {l: 0, t: 130, w: 180, h: 30}
    st.font = font.xsmall
    st.color = color.black
    st.text = 'Pls fill your sign up Email reset your password.'
  end

  def email(st)
    st.frame = {l: 0, t: 170, w: 180, h: 30}
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

  def reset_btn(st)
    st.frame = {l: 0, t: 210, w: 180, h: 30}
    st.font = font.small
    st.color = color.white
    st.background_color = color.tint_color
    st.text = 'Reset Password'
  end
end
