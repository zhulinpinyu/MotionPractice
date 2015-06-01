class HomeScreen < PM::Screen
  title "Tow in one"
  stylesheet HomeScreenStylesheet

  def on_load
    @map = MapScreen.new
    @station = StationScreen.new(container: WeakRef.new(self))
  end

  def will_appear
    @view_setup ||= self.setup_view
  end

  def setup_view
    append(@station.view, :station_view)
    append(@map.view, :map_view)
    # add @station.view, {
    #   frame: CGRectMake(0, 60, view.frame.size.width / 4, view.frame.size.height)
    # }

    # add @map.view, {
    #   frame: CGRectMake(view.frame.size.width / 4, 60, view.frame.size.width * 3 / 4, view.frame.size.height)
    # }

    true
  end

  def tapped_station(args)
    @map.go_to((args[:station]))
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
