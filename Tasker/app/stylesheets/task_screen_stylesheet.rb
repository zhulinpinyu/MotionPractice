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
    st.background_color = color.gray
  end

  def text_field(st)
    st.frame = [[20,100],[100,30]]
    st.placeholder = "WER"
  end
end
