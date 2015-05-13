class MainStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def name_label(st)
    st.frame = {top: 100, width: 200, height: 18, centered: :horizontal}
    st.text_alignment = :center
    st.color = color.battleship_gray
    st.font = font.medium
    st.text = 'Store Name'
  end

  def name_field(st)
    st.frame = {top: 150, width: 200, height: 40, centered: :horizontal}
    st.background_color = color.gray
  end

  def save_button(st)
    st.frame = {top: 200, width: 100, height: 30, centered: :horizontal}
    st.color = color.battleship_gray
    st.background_color = color.from_hex("ff9900")
    st.font = font.medium
    st.text = 'Save'
  end

  def store_name(st)
    st.text_alignment = :center
    st.color = color.battleship_gray
    st.font = font.medium
  end

end
