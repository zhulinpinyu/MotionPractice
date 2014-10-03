class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible
    @window.rootViewController = klazz.alloc.init
    true
  end

  def klazz
    part = ENV['PART']
    if part.nil?
      part = '6'
      puts "Pls use default part #{part}"
    else
      puts "Using part #{part}"
    end

    case part
    when '1'
      Loginv1Controller
    when '2'
      Loginv2Controller
    end
  end
end
