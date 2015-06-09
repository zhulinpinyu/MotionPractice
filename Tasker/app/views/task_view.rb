class TaskView < UIScrollView
  def rmq_build
    append!(TextField, :text_field)
    append!(UILabel, :note_label)
    append!(UITextView, :text_view)
    append!(UIDatePicker, :date_picker)
  end
end