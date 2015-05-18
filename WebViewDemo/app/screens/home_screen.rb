class HomeScreen < PM::WebScreen
  title "OL3Map"

  def content
    NSURL.URLWithString("http://localhost/~lixiangmu/openlayer3/mobile/ol3map/")
  end

  def load_finished
    webview.stringByEvaluatingJavaScriptFromString("setCenter(#{32},#{114})")
  end

end
