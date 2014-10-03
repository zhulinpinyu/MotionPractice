class MainStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.battleship_gray
  end

  def email(st)
    st.frame = {top: 60, width: 160, height: 25, centered: :horizontal}
    st.text_alignment = :left
    st.background_color = color.white
    st.font = font.small
    st.text = 'Email'
  end

  def password(st)
    st.frame = {top: 90, width: 160, height: 25, centered: :horizontal}
    st.text_alignment = :left
    st.background_color = color.white
    st.font = font.small
    st.text = 'Password'
  end

  def submmit_btn(st)
    st.frame = {top: 120, width: 160, height: 25, centered: :horizontal}
    st.background_color = color.green
    st.font = font.small
    st.text = 'Login'
  end

  def login_form(st)
    st.frame = {top: 30, width: 200, height: 100, centered: :horizontal}
  end

end
