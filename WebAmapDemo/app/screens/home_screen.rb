class HomeScreen < PM::WebScreen
  title "Web Amap"
  stylesheet HomeScreenStylesheet

  def on_load
    set_nav_bar_button :left, system_item: :camera, action: :capture
  end

  def content
    NSURL.URLWithString("http://localhost/~lixiangmu/openlayer3/amap/")
  end

  def capture
    UIImageWriteToSavedPhotosAlbum(image.from_view(self.view), nil,nil,nil)
  end
end
