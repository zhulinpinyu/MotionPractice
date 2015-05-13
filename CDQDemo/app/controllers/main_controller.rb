class MainController < UIViewController

  def viewDidLoad
    super

    rmq.stylesheet = MainStylesheet
    self.title = 'CDQ 使用'
    rmq(self.view).apply_style :root_view

    # Create your UIViews here
    rmq.append(UILabel, :name_label)
    @name = rmq.append(UITextField, :name_field).focus.get
    rmq.append(UIButton, :save_button).on(:touch) do
      Store.create(name: @name.text)
      cdq.save
      App.alert("Saved")
    end

    Store.all.each_with_index do |store, index|
      store_name = rmq.append(UILabel, :store_name).get
      store_name.text = store.name
      store_name.frame = [[20, 220+index * 30],[200,26]]
    end

  end

end