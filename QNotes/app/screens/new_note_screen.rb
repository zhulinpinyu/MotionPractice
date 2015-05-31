class NewNoteScreen < PM::Screen
  attr_accessor :manager

  title "New Note"
  stylesheet NewNoteScreenStylesheet
  def on_init
    set_tab_bar_item system_item: :downloads
  end

  def on_load
    note_field = append(UITextField, :note_field).get
    append(UIButton, :save_button).on(:touch) do
      content = note_field.text
      manager.add(Note.new(content))
      manager.save
      self.navigationController.popViewControllerAnimated(true)
    end
  end
end
