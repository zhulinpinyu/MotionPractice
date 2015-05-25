class HomeScreen < PM::Screen
  MAPBOX_KEY = "pk.eyJ1IjoianVzdGluIiwiYSI6IlpDbUJLSUEifQ.4mG8vhelFMju6HpIY-Hi5A"
  title "MapBox"
  stylesheet HomeScreenStylesheet

  def on_load
    set_nav_bar_button :right, system_item: :organize, action: :download

    RMConfiguration.sharedInstance.setAccessToken(MAPBOX_KEY)
    @map_view = RMMapView.alloc.initWithFrame(self.view.bounds, andTilesource: tile_source)
    @map_view.zoom = 13
    @map_view.centerCoordinate = CLLocationCoordinate2DMake(22.53,114.02)
    @map_view.tileCache = RMTileCache.alloc.initWithExpiryPeriod(0)
    self.view = @map_view
  end

  def tile_source
    tile_JSON = NSUserDefaults.standardUserDefaults().objectForKey("tileJSON")
    if tile_JSON
      tile_source = RMMapboxSource.alloc.initWithTileJSON(tile_JSON)
    else
      tile_source = RMMapboxSource.alloc.initWithMapID("mapbox.streets")
    end
    return tile_source
  end

  def download
    @map_view.removeAllCachedImages()
    tileJSON = @map_view.tileSource.tileJSON
    NSUserDefaults.standardUserDefaults().setObject(tileJSON, forKey: "tileJSON")
    rmq.animations.start_spinner
    @map_view.tileCache.backgroundCacheDelegate = self
    box = @map_view.latitudeLongitudeBoundingBox().to_a
    p box
    @map_view.tileCache.beginBackgroundCacheForTileSource(@map_view.tileSource,
      southWest: CLLocationCoordinate2DMake(box[0][0],box[0][1]),
      northEast: CLLocationCoordinate2DMake(box[1][0],box[1][1]),
      minZoom: 12,
      maxZoom: 15)
  end

  def tileCacheDidFinishBackgroundCache(tileCache)
    rmq.animations.stop_spinner
  end
end
