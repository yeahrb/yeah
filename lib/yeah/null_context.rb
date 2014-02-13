class Yeah::NullContext
  def each_tick(&block)
    yield
  end

  def method_missing(*args, &block); end
end
