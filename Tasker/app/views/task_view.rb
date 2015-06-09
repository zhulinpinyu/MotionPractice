class TaskView < UIScrollView
  def rmq_build
    append!(UITextField, :text_field)
  end
end