class HomeScreen < PM::Screen
  title "MapBox"
  stylesheet HomeScreenStylesheet

  def on_load
    @hello_world = append!(UILabel, :hello_world)
  end
end
