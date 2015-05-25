class HomeScreen < PM::Screen
  MAPBOX_KEY = "pk.eyJ1IjoianVzdGluIiwiYSI6IlpDbUJLSUEifQ.4mG8vhelFMju6HpIY-Hi5A"
  title "MapBox"
  stylesheet HomeScreenStylesheet

  def on_load
    set_nav_bar_button :right, system_item: :organize, action: :download

    RMConfiguration.sharedInstance.setAccessToken(MAPBOX_KEY)
    map_view = RMMapView.alloc.initWithFrame(self.view.bounds, andTilesource: tile_source)
    map_view.zoom = 13
    map_view.centerCoordinate = CLLocationCoordinate2DMake(22.53,114.02)
    self.view = map_view
  end

  def tile_source
    tile_JSON = NSUserDefaults.standardUserDefaults().objectForKey("tileJSON")
    if tile_JSON
      tile_source = RMMapboxSource.initWithTileJSON(tile_JSON)
    else
      tile_source = RMMapboxSource.alloc.initWithMapID("mapbox.streets")
    end
    return tile_source
  end

  def download
    p "mlx"
  end
end
