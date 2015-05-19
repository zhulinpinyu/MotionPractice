class HomeScreen < PM::Screen
  MAPBOX_KEY = "pk.eyJ1Ijoiemh1bGlucGlueXUiLCJhIjoieWJDdWwzTSJ9.PfVmp2AcPEzrCMvejwfPDA"
  title "MapBox"
  stylesheet HomeScreenStylesheet

  def on_load
    @hello_world = append!(UILabel, :hello_world)
    RMConfiguration.sharedInstance.setAccessToken(MAPBOX_KEY)
    tile_source = RMMapboxSource.alloc.initWithMapID("mapbox.streets")
    map_view = RMMapView.alloc.initWithFrame(self.view.bounds, andTilesource: tile_source)
    map_view.zoom = 17
    map_view.centerCoordinate = CLLocationCoordinate2DMake(22.53,114.02)
    self.view = map_view
  end
end
