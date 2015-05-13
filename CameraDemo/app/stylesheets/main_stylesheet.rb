class MainStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def camera_button(st)
    st.frame = {top: 100, width: 200, height: 30, centered: :horizontal}
    st.background_color = color.from_hex('FF9900')
    st.color = color.battleship_gray
    st.font = font.medium
    st.text = '拍照'
  end

  def album_button(st)
    st.frame = {top: 150, width: 200, height: 30, centered: :horizontal}
    st.background_color = color.from_hex('FF9900')
    st.color = color.battleship_gray
    st.font = font.medium
    st.text = '相册'
  end

  def multi_pictures_button(st)
    st.frame = {top: 200, width: 200, height: 30, centered: :horizontal}
    st.background_color = color.from_hex('FF9900')
    st.color = color.battleship_gray
    st.font = font.medium
    st.text = '图片多选'
  end
end
