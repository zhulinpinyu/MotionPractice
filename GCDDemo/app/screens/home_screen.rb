class HomeScreen < PM::Screen
  title "多线程技术"
  stylesheet HomeScreenStylesheet

  def on_load
    init_nav
    append!(UIImageView, :red_image)
    append!(UIImageView, :green_image)
    append!(UIImageView, :blue_image)
  end

  def on_appear
    urls = ImageList.sharedInstance.images

    #q = Dispatch::Queue.new('zlpy.ImageLoading')
    q = Dispatch::Queue.concurrent(:default) #:default, :high, :low
    urls.each do |url|
      q.async do
        image_data = NSData.dataWithContentsOfURL(NSURL.URLWithString(url))
        image = UIImage.imageWithData(image_data)
        Dispatch::Queue.main.sync do
          rmq(UIImageView)[urls.index(url)].get.image = image
        end
      end
    end
  end

  def init_nav
    set_nav_bar_button :left, system_item: :camera, action: :nav_left_button
    set_nav_bar_button :right, title: "→", action: :nav_right_button
  end

  def nav_left_button
    mp "Left"
  end

  def nav_right_button
    mp "Right"
  end
end
