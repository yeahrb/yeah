module Yeah
module Unplatform

class Context
  def method_missing(*args, &block)
    yield if block
  end
end

end
end
