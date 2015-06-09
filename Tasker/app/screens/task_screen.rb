class TaskScreen < PM::Screen
  attr_accessor :task, :task_view

  title "Task"
  stylesheet TaskScreenStylesheet

  def on_load
    init_nav
    @task_view = append!(TaskView, :task_view)
    if self.task
      self.title = self.task.title
      @task_view.title.text = self.task.title
      @task_view.note.text = self.task.note
      @task_view.due_at.date = self.task.due_at
    else
      self.title = "Add Task"
    end
  end

  def will_disappear
    update_task
  end

  private

    def init_nav
      set_nav_bar_button :right, system_item: :save, action: :save_task
    end

    def save_task
      close
    end

    def update_task
      if self.task
        self.task.title = self.task_view.title.text
        self.task.note = self.task_view.note.text
        self.task.due_at = self.task_view.due_at.date
      else
        Task.create(
          title: self.task_view.title.text,
          note: self.task_view.note.text,
          due_at: self.task_view.due_at.date
        )
      end
      cdq.save
    end

end
