class NoteManager
  attr_accessor :notes

  def initialize
    all_notes
  end

  def all_notes
    data = NSUserDefaults.standardUserDefaults.objectForKey("notes")
    self.notes = NSKeyedUnarchiver.unarchiveObjectWithData(data)||[]
  end

  def add(note)
    self.notes << note
  end

  def save
    data = NSKeyedArchiver.archivedDataWithRootObject(self.notes)
    NSUserDefaults.standardUserDefaults.setObject(data, forKey: "notes")
    NSUserDefaults.standardUserDefaults.synchronize
  end

end