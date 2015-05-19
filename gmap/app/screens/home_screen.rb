class HomeScreen < PM::Screen
  GMAP_KEY = "GOOGLE_MAP_KEY"
  title "Gmap"
  stylesheet HomeScreenStylesheet

  def on_load
    GMSServices.provideAPIKey(GMAP_KEY)
    camera = GMSCameraPosition.cameraWithLatitude(22.53, longitude: 114.02, zoom: 15)
    @map_view = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
    @map_view.myLocationEnabled = true
    self.view = @map_view
  end
end
