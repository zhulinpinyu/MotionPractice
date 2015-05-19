class NewNoteScreenStylesheet < ApplicationStylesheet
  # Add your view stylesheets here. You can then override styles if needed,
  # example: include FooStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def note_field(st)
    st.frame = {l: 10, t: 100, w: 200, h: 30, centered: :horizontal}
    st.background_color = color.light_gray
  end

  def save_button(st)
    st.frame = {l: 10, t: 160, w: 100, h: 30, centered: :horizontal}
    st.background_color = color.gray
    st.text = "Save"
  end
end
