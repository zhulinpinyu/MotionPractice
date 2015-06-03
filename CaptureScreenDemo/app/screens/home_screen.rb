class HomeScreen < PM::Screen
  title "截屏"
  stylesheet HomeScreenStylesheet

  def on_load
    set_nav_bar_button :right, system_item: :camera, action: :capture

    @hello_world = append!(UILabel, :hello_world)
  end

  def capture
    UIImageWriteToSavedPhotosAlbum(image.from_view(self.view), nil,nil,nil)
  end

end
