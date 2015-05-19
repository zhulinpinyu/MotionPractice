class AmapScreen < PM::MapScreen
  title "AMap"
  stylesheet AmapScreenStylesheet

  start_position(latitude: 22.53, longitude: 114.03, radius: 1)

  tap_to_add(length: 1.5, annotation: {
    title: "MLX Dropped in",
    animates_drop: true,
    action: :show_details
  })

  def on_load
  end

  def annotation_data
    [{
      coordinate: CLLocationCoordinate2DMake(22.53, 114.03),
      title: "Rainbow Falls",
      subtitle: "Nantahala National Forest",
      image: UIImage.imageNamed("icon-60"),
      action: :show_details
    }]
  end

  def show_details
    selected = selected_annotations.first
    p selected.title
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
