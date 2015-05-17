class DetailScreen < PM::Screen
  attr_accessor :index

  def will_appear
    self.title = "Details #{self.index}"

    set_attributes(self.view,{
      background_color: hex_color("#FFFFFF")
    })

    add(UILabel.new, {
      text: "ProMotion TableScreen cell #{self.index}",
      frame: [[50,200], [300,30]],
      font: UIFont.systemFontOfSize(20),
      text_alignment: NSTextAlignmentCenter,
    })
  end
end