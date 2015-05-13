class WsAssetPickerDelegate
  attr_reader :controller

  def initialize(controller)
    @controller = controller
  end

  # cancel & back
  def assetPickerControllerDidCancel(sender)
    controller.dismissViewControllerAnimated(true, completion: nil)
  end

  # Picker & back
  def assetPickerController(sender, didFinishPickingMediaWithAssets: assets)
    controller.dismissViewControllerAnimated(true, completion:-> {
      assets.each_with_index do |asset, index|
        image = UIImage.imageWithCGImage(asset.thumbnail, scale:1.0, orientation: asset.defaultRepresentation.orientation)
        image_view = UIImageView.alloc.initWithImage(image)
        image_view.frame = [[20 + (index % 3) * 100, 280 + (index / 3) * 90], [80,80]]
        controller.view.addSubview(image_view)
      end
    })
  end
end