class TaskScreenStylesheet < ApplicationStylesheet
  # Add your view stylesheets here. You can then override styles if needed,
  # example: include FooStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def task_view(st)
    st.frame = :full
    st.background_color = color.white
  end

  def text_field(st)
    st.frame = [[20,20],[280,40]]
    st.placeholder = "e.g. Do You Want"
    st.layer.borderWidth = 1
    st.layer.borderColor = color.gray.CGColor
    st.layer.cornerRadius = 3
  end

  def note_label(st)
    st.frame = {l:20, t: 80, w: 280, h:40}
    st.text = "Notes"
    st.font = UIFont.boldSystemFontOfSize(14)
    st.text_color = color.dark_gray
  end

  def text_view(st)
    st.frame = {l:20, t:125, w: 280, h:100}
    st.layer.borderWidth = 1
    st.layer.borderColor = color.gray.CGColor
    st.layer.cornerRadius = 3
    st.font = UIFont.systemFontOfSize(14)
  end

  def date_picker(st)
    st.frame = {l:0, t:230, w: 320, h:100}
  end
end
