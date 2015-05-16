class DiscourseFetcher
  attr_reader :url

  def initialize(endpoint)
    @url = "http://community.rubymotion.com/#{endpoint}"
  end

  def fetch(&block)
    AFMotion::JSON.get(url) do |result|
      block.call result.object
    end
  end
end