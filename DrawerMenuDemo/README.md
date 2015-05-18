DrawerMenuDemo
===

1. add gem in Gemfile
```ruby
gem 'ProMotion-menu'
```

2. Install gem and pod
```ruby
bundle
rake pod:install
```

**!!!IMPORTANT**

[menu_drawer.rb](https://github.com/zhulinpinyu/MotionPractice/blob/master/DrawerMenuDemo/app/menu_drawer.rb)

```ruby
class MenuDrawer < PM::Menu::Drawer
  def setup
    self.center = HomeScreen.new(nav_bar: true)
    self.left = NavigationScreen.new(nav_bar: true)
    self.to_show = [:pan_bezel, :pan_nav_bar]
    self.to_hide = :all
    self.transition_animation = :slide
    self.max_left_width = 150
    self.shadow = false
  end
end
```

ProMotion ProMotion-menu 实现抽屉menu的效果


Thanks, [http://stackoverflow.com/questions/29086092/how-to-use-promotion-menu](http://stackoverflow.com/questions/29086092/how-to-use-promotion-menu)

ReF: [ProMotion-menu Doc](https://github.com/clearsightstudio/ProMotion-menu/blob/master/README.md)
