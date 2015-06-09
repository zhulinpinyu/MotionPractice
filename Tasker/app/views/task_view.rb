class TaskView < UIScrollView
  attr_accessor :title, :note, :due_at

  def rmq_build
    @title = append!(TextField, :text_field)
    append!(UILabel, :note_label)
    @note = append!(UITextView, :text_view)
    @due_at = append!(UIDatePicker, :date_picker)
  end
end