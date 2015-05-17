class AboutScreen < PM::WebScreen
  title "About MIM"

  def on_load
    set_nav_bar_button :right, title: "X", action: :close_about_screen
  end

  def content
    NSURL.URLWithString("https://motioninmotion.tv/about")
  end

  def close_about_screen
    close
  end
end