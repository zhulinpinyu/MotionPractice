class HomeScreenStylesheet < ApplicationStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def red_image(st)
    st.frame = {t: 130, l: 30, w: 86, h: 86}
    st.background_color = color.red
  end

  def green_image(st)
    st.frame = {t: 130, l: 127, w: 86, h: 86}
    st.background_color = color.green
  end

  def blue_image(st)
    st.frame = {t: 130, l: 224, w: 86, h: 86}
    st.background_color = color.blue
  end

end
