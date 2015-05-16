class UserScreenState
  include ViewHelpers

  attr_accessor :avatar, :name, :last_seen_at, :details_title

  def attr(attribute)
    self.send(attribute) || defaults[attribute]
  end

  def defaults
    {
      name: "Loading...",
      last_seen_at: "",
      avatar: rmq.image.resource("zlpy"),
      details_title: ""
    }
  end
end