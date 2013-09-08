class Yeah::Rectangle
  def size
    @size ||= Yeah::Vector[]
  end

  def size=(value)
    @size = value
  end
end
