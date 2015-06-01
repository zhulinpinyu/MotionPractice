class HomeScreen < PM::TableScreen
  attr_accessor :manager

  title "QNotes"
  stylesheet HomeScreenStylesheet

  def on_init
    self.manager = NoteManager.new
  end

  def on_load
    set_nav_bar_button :right, system_item: :add, action: :add_note
    set_tab_bar_item system_item: :favorites
  end

  def will_appear
    update_table_data
  end

  def add_note
    new_note_screen = NewNoteScreen.new
    new_note_screen.manager = manager
    open new_note_screen
  end

  def table_data
    [{
      cells: notes.map do |note|
        {
          title: note.content,
          height: 90,
          accessory: {
            view: :switch, # UIView or :switch
            value: true, # whether it's "checked" or not
            action: :accessory_switched,
            arguments: {checked: :value}
          },
          editing_style: :delete
        }
      end
    }]
  end

  def accessory_switched(args)
    p args[:value]
  end

  def on_cell_deleted(cell)
    manager.delete(cell[:title])
  end

  def notes
    manager.all_notes
  end
end
