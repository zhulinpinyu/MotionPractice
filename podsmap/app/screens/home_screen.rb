class HomeScreen < PM::Screen
  BMAP_AK = "DEVELOPMENT_KEY"
  stylesheet HomeScreenStylesheet

  def on_load
    bmm = BMKMapManager.alloc.init
    bmm.start(BMAP_AK, generalDelegate: self)
    self.view = BMKMapView.alloc.init
  end
end
