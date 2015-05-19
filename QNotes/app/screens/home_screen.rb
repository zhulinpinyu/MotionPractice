class HomeScreen < PM::TableScreen
  attr_accessor :manager

  title "QNotes"
  stylesheet HomeScreenStylesheet

  def on_init
    self.manager = NoteManager.new
  end

  def on_load
    set_nav_bar_button :right, system_item: :add, action: :add_note
  end

  def will_appear
    self.tableView.reloadData
  end

  def add_note
    new_note_screen = NewNoteScreen.new
    new_note_screen.manager = manager
    open new_note_screen
  end

  def table_data
    [{
      cells: manager.all_notes.map do |note|
        {
          title: note.content
        }
      end
    }]
  end
end
