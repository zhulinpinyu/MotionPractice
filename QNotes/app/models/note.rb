class Note
  attr_accessor :content

  def initialize(content)
    self.content = content
  end

  def initWithCoder(decoder)
    self.content = decoder.decodeObjectForKey("content")
    self
  end

  def encodeWithCoder(encoder)
    encoder.encodeObject(self.content, forKey: "content")
  end
end