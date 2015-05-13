class MainController < UIViewController

  def viewDidLoad
    super

    rmq.stylesheet = MainStylesheet
    self.title = '相机的使用'
    rmq(self.view).apply_style :root_view

    # Camera button
    @camera_button = rmq.append(UIButton, :camera_button).on(:touch) do
      take_photo
    end

    #相册
    rmq.append(UIButton, :album_button).on(:touch) do
      select_album
    end

    #select multi picture
    rmq.append(UIButton, :multi_pictures_button).on(:touch) do
      show_picker
    end
  end

  def take_photo
    if BW::Device.camera.rear?
      BW::Device.camera.rear.picture(media_types: [:image, :movie]) do |result|
        save_photo(result[:original_image])
        set_photo(result[:original_image])
      end
    else
      App.alert("后置摄像头存在故障")
    end
  end

  def select_album
    BW::Device.camera.any.picture(media_types: [:image]) do |result|
      set_photo(result[:original_image])
    end
  end

  def show_picker
    @library ||= ALAssetsLibrary.alloc.init
    controller = WSAssetPickerController.alloc.initWithAssetsLibrary(@library)
    controller.delegate = ws_asset_picker_delegate
    self.presentViewController(controller, animated:true, completion:nil)
  end

  def save_photo(photo)
    data = UIImagePNGRepresentation(photo)
    data.writeToFile(App.documents_path+'/ol3map', atomically: true)
    UIImageWriteToSavedPhotosAlbum(photo,nil,nil,nil)
  end

  def set_photo(photo)
    return unless photo
    image_view = UIImageView.alloc.initWithImage(photo)
    image_view.setContentMode(UIViewContentModeScaleToFill)
    image_view.frame = [[20,280],[80,80]]
    view.addSubview(image_view)
  end

  def ws_asset_picker_delegate
    @ws_asset_picker_delegate ||= WsAssetPickerDelegate.new(self)
  end
end
