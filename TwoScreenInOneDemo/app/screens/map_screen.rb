class MapScreen < PM::MapScreen
  start_position latitude: 22.53 ,longitude: 114.03,radius: 10

  stylesheet MapScreenStylesheet

  def annotation_data
    []
  end

  def go_to(address)
    look_up_address address: address do |points, error|
      unless error
        state = points.first
        if state
          puts state.region.center
          puts state.region.radius
          my_region = MKCoordinateRegionMakeWithDistance(state.region.center, state.region.radius*2, state.region.radius*2)
          set_region my_region, true
        end
      end
    end
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
    reapply_styles
  end
end
