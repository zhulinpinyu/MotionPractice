class HomeScreenStylesheet < ApplicationStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def station_view(st)
    st.frame = {l: 0, t: 60, w: Device.screen.width / 4, h: Device.screen.height }
  end

  def map_view(st)
    st.frame = {l: Device.screen.width / 4, t: 60, w: Device.screen.width * 3 / 4, h: Device.screen.height }
  end

end
