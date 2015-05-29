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
    map_view.delegate = self
    annotation1 = MAPointAnnotation.alloc.init
    annotation1.coordinate = CLLocationCoordinate2DMake(22.533773, 114.029946)
    annotation1.title = "KFC"
    annotation1.subtitle = "KFC TA"
    map_view.addAnnotation(annotation1)

    annotation2 = MAPointAnnotation.alloc.init
    annotation2.coordinate = CLLocationCoordinate2DMake(22.535, 114.03)
    annotation2.title = "MCD"
    annotation2.subtitle = "MCD TA"
    map_view.addAnnotation(annotation2)

    annotation3 = MAPointAnnotation.alloc.init
    annotation3.coordinate = CLLocationCoordinate2DMake(22.535, 114.032)
    annotation3.title = "DDM"
    annotation3.subtitle = "DDM TA"
    map_view.addAnnotation(annotation3)

    self.view = map_view
  end

  def mapView(map_view, viewForAnnotation: annotation)
    @point_identifier ||= "point_identifier"
    annotation_view = map_view.dequeueReusableAnnotationViewWithIdentifier(@point_identifier)
    unless annotation_view
      annotation_view = MAPinAnnotationView.alloc.initWithAnnotation(annotation, reuseIdentifier: @point_identifier)
    end
    annotation_view.setCanShowCallout(true)
    annotation_view.setAnimatesDrop(true)
    annotation_view.setPinColor(MAPinAnnotationColorGreen)
  end
end
