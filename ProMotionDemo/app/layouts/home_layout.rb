class HomeLayout < MK::Layout
  view :products_view

  def layout
    root :home do
      add(UIImageView, :profile_image)
      add(UILabel, :profession)
      add(products_view, :products)
    end
  end

  def home_style
    background_color "#F9F9F9".uicolor
  end

  def profile_image_style
    image "zlpy".uiimage
    clips_to_bounds true
    layer do
      corner_radius 50.0
    end

    constraints do
      left 20
      top 84
      width 100
      height 100
    end
  end

  def profession_style
    text("Man, Programer")
    font(UIFont.boldSystemFontOfSize(20))
    constraints do
      top 118
      right_of(:profile_image).plus(20)
      height 30
    end
  end

  def products_style
    top 200
    left 0
    right "100%"
  end
end