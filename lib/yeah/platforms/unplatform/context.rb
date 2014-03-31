module Yeah
module Unplatform

class Context
  def on_tick(&block)
    yield
  end

  def method_missing(*args, &block); end
end

end
end
