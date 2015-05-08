class StaticLanguagesController < BaseLanguagesController

  def init
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('Static', image: rmq.image.resource('basketball'), tag: 0)
    self.title = 'Static'
    self
  end

  def viewDidLoad
    super
    navigationItem.title = "Static Languages"
    view.dataSource = view.delegate = self
    language_service = rmq.app.delegate.language_service
    @data = language_service.static
    @keys = @data.map {|r| r.name}
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER_FOR_STATIC_LANGUAGE"
    super
  end
end