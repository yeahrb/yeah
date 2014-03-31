module Yeah
module Unplatform

class Context
  def method_missing(*args, &block)
    yield if block
  end

  def screen
    self
  end

  def mouse
    self
  end
end

end
end
