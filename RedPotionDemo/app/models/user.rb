class User
  include ImageHelpers

  attr_reader :username, :avatar, :name, :last_seen_at

  def initialize(user_json)
    @name = user_json[:name]
    @username = user_json[:username]
    @avatar = build_avatar(user_json)
    @last_seen_at = user_json[:last_seen_at]
  end

  def build_avatar(user_json)
    image_from_url("http://community.rubymotion.com/#{user_json[:avatar_template]}".gsub("{size}", "150"))
  end
end