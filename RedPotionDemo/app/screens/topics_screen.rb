class TopicsScreen < PM::TableScreen
  attr_reader :topics

  refreshable
  title "RubyMotion 社区"
  stylesheet TopicsScreenStylesheet

  def on_load
    @topics = []
    start_refreshing
  end

  def start_refreshing
    app_delegate.notifier.loading
    fetcher = DiscourseFetcher.new("latest.json")

    fetcher.fetch do |topics_json|
      @topics = Topic.build_many(topics_json)
      end_refreshing
      update_table_data
      app_delegate.notifier.dismiss
    end
  end

  def table_data
    [{
      title: "",
      cells: topics.map do |topic|
        {
          title: topic.title,
          subtitle: "last poster: #{topic.last_poster}",
          action: :open_profile,
          arguments: {topic: topic}
        }
      end
    }]
  end

  def on_refresh
    start_refreshing
  end

  def open_profile(data)
    open UserScreen.new(topic: data[:topic])
  end

  def will_animate_rotate(orientation, duration)
    find.all.reapply_styles
  end

end
