class UserScreenStylesheet < ApplicationStylesheet
  def root_view(st)
    st.background_color = color.white
  end

  def name(st)
    st.frame = {top: 90, from_right: 20, right_of_previous: 20, height: 150}

    st.number_of_lines = 0
    st.text_alignment = :left
    st.line_break_mode = :word_wrapping
    st.font = UIFont.boldSystemFontOfSize(25.0)
  end

  def last_seen_at(st)
    user_detail_item(st)
  end

  def details_title(st)
    user_detail_item(st)
    st.text_alignment = :left
    st.font = UIFont.boldSystemFontOfSize(20.0)
    st.color = color.black
  end

  def user_detail_item(st)
    st.frame = {left: 20, from_right: 20, below_previous: 30, height: 50}
  end

  def avatar_image(st)
    st.frame = {left: 20, width: 150, height: 150, below_previous: 90}
    st.corner_radius = 30
  end
end
