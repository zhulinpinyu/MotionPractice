module ImageHelpers
  def image_from_url(image_url)
    image_data = NSData.dataWithContentsOfURL(NSURL.URLWithString(image_url))
    UIImage.imageWithData(image_data)
  end
end