class StationScreen < PM::TableScreen
  attr_accessor :container

  stylesheet StationScreenStylesheet

  def table_data
    [{
      title: "",
      cells: ["购物公园","福田","会展中心"].map do |station|
        {
          title: station,
          action: :tapped_station,
          arguments: {station: station}
        }
      end
    }]
  end

  def tapped_station(args)
    container.tapped_station(args)
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
