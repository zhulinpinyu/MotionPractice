class HomeScreen < PM::Screen
  AMAP_KEY = "KEY"
  title "Amap"
  stylesheet HomeScreenStylesheet

  def on_load
    MAMapServices.sharedServices.apiKey = AMAP_KEY
    map_view = MAMapView.alloc.initWithFrame(CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)))
    coordinate = {latitude: 22.535, longitude: 114.03}
    map_view.setCenterCoordinate(CLLocationCoordinate2DMake(coordinate[:latitude],coordinate[:longitude]))
    map_view.setZoomLevel(17, animated: false)
    #map_view.delegate = self
    annotation = MAPointAnnotation.alloc.init
    annotation.coordinate = CLLocationCoordinate2DMake(22.533773, 114.029946)
    annotation.title = "KFC"
    annotation.subtitle = "KFC TA"
    map_view.addAnnotation(annotation)
    self.view = map_view
  end
end
