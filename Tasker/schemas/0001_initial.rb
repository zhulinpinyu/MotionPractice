schema "0001 initial" do
  entity "Task" do
    string :title, optional: false
    string :note
    datetime :due_at, optional: false
  end
end
