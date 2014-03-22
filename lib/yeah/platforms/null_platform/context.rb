module Yeah
module NullPlatform

class Context
  def each_tick(&block)
    yield
  end

  def method_missing(*args, &block); end
end

end
end
