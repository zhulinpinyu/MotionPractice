class AppDelegate < PM::Delegate
  attr_accessor :notifier

  status_bar true, animation: :fade

  def on_load(app, options)
    @notifier = Motion::Blitz
    open TopicsScreen.new(nav_bar: true)
  end
end
