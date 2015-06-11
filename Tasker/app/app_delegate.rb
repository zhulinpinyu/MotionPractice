class AppDelegate < PM::Delegate
  include CDQ # Remove this if you aren't using CDQ
  include PM::DelegateNotifications

  StandardAppearance.apply

  status_bar true, animation: :fade

  def on_load(app, options)
    cdq.setup
    register_for_push_notifications :all
    open HomeScreen.new(nav_bar: true)
  end

  # def on_unload
  #   unregister_for_push_notifications
  # end

  def on_push_registration(token, error)
    mp token.description
    mp registered_push_notifications
  end

  def on_push_notification(notification, launched)
    mp notification.alert
    mp notification.aps
  end
end
