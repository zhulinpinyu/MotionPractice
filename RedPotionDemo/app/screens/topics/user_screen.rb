class UserScreen < PM::Screen
  include ViewHelpers

  attr_reader :state
  attr_accessor :topic

  stylesheet UserScreenStylesheet

  def title
    "😀 #{topic.last_poster}"
  end

  def on_load
    #app_delegate.notifier.loading
    app_delegate.notifier.loading(:black)
    @state = UserScreenState.new
    set_state
    fetch_user
  end

  def set_state
    build_initial_ui unless @ui_built

    find(:name).data(state.attr(:name))
    find(:avatar_image).data(state.attr(:avatar))
    find(:details_title).data(state.attr(:details_title))
    find(:last_seen_at).data(state.attr(:last_seen_at))
  end

  def build_initial_ui
    append(UIImageView, :avatar_image)
    append(UILabel, :name)
    append(UILabel, :details_title)
    append(UILabel, :last_seen_at)

    @ui_built = true
  end

  def fetch_user
    fetcher = DiscourseFetcher.new("users/#{topic.last_poster}.json")
    fetcher.fetch do |response|
      user = User.new(response[:user])
      state.name = user.name
      state.avatar = user.avatar
      state.last_seen_at = "Last Seen on #{datetime_long(user.last_seen_at)}"
      state.details_title = "User Information"

      set_state
      app_delegate.notifier.dismiss
    end
  end

end
