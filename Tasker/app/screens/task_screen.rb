class TaskScreen < PM::Screen
  title "Task"
  stylesheet TaskScreenStylesheet

  def on_load
    set_nav_bar_button :right, title: "X", action: :close
    append!(TaskView, :task_view)
  end

  def will_animate_rotate(orientation, duration)
    reapply_styles
  end
end
