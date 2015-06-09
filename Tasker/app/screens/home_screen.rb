class HomeScreen < PM::TableScreen
  title "Tasker"
  stylesheet HomeScreenStylesheet

  def on_load
    init_nav
    @tasks = Task.all
  end

  def will_appear
    update_table_data
  end

  def table_data
    [{
      cells: @tasks.map do |task|
        {
          title: task.title,
          subtitle: NSDateFormatter.localizedStringFromDate(
            task.due_at,
            dateStyle:NSDateFormatterMediumStyle,
            timeStyle:NSDateFormatterMediumStyle
          ),
          editing_style: :delete
        }
      end
    }]
  end

  def on_cell_deleted(cell)
    Task.where(:title).eq(cell[:title]).first.destroy
    cdq.save
  end

  def add_task
    open_modal TaskScreen.new(nav_bar: true,
      transition_style: UIModalTransitionStyleFlipHorizontal,
      presentation_style: UIModalPresentationFormSheet
    )
  end

  def init_nav
    set_nav_bar_button :right, system_item: :add, action: :add_task
  end
end
