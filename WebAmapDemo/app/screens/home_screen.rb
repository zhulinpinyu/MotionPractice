class HomeScreen < PM::WebScreen
  title "Web Amap"
  stylesheet HomeScreenStylesheet

  def content
    NSURL.URLWithString("http://localhost/~lixiangmu/openlayer3/amap/")
  end
end
