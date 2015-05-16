class Topic
  attr_reader :title, :last_poster

  def self.build_many(topics_json)
    topics_json["topic_list"]["topics"].map do |topic_json|
      self.new(topic_json)
    end
  end

  def initialize(topic_json)
    @title = topic_json["title"]
    @last_poster = topic_json["last_poster_username"]
  end

end