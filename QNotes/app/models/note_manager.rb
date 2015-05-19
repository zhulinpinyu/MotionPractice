class NoteManager
  attr_accessor :notes

  def initialize
    @notes = []
  end

  def all_notes
    self.notes
  end

  def add(note)
    self.notes << note
  end

end