class AppDelegate

  attr_reader :language_service

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible
    @language_service = LanguageService.new
    @window.rootViewController = build_tab_bar
    true
  end

  private

    def build_tab_bar
      tabbar = UITabBarController.alloc.init
      tabbar.viewControllers = [
        UINavigationController.alloc.initWithRootViewController(StaticLanguagesController.alloc.init),
        UINavigationController.alloc.initWithRootViewController(DynamicLanguagesController.alloc.init),
        UINavigationController.alloc.initWithRootViewController(AllLanguagesController.alloc.init),
        UINavigationController.alloc.initWithRootViewController(MoreActionsController.alloc.init)
      ]
      tabbar.selectedIndex = 0
      tabbar.delegate = self
      tabbar
    end
end
