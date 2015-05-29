class HomeScreen < PM::Screen
  AMAP_KEY = "KEY"
  title "Amap"
  stylesheet HomeScreenStylesheet

  def on_load
    MAMapServices.sharedServices.apiKey = AMAP_KEY
    map_view = MAMapView.alloc.initWithFrame(CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)))
    coordinate = {latitude: 22.53, longitude: 114.03}
    map_view.setCenterCoordinate(CLLocationCoordinate2DMake(coordinate[:latitude],coordinate[:longitude]))
    map_view.setZoomLevel(17, animated: false)
    #map_view.delegate = self
    self.view = map_view
  end

  # You don't have to reapply styles to all UIViews, if you want to optimize, another way to do it
  # is tag the views you need to restyle in your stylesheet, then only reapply the tagged views, like so:
  #   def logo(st)
  #     st.frame = {t: 10, w: 200, h: 96}
  #     st.centered = :horizontal
  #     st.image = image.resource('logo')
  #     st.tag(:reapply_style)
  #   end
  #
  # Then in will_animate_rotate
  #   find(:reapply_style).reapply_styles#

  # Remove the following if you're only using portrait
  def will_animate_rotate(orientation, duration)
    find.all.reapply_styles
  end
end
