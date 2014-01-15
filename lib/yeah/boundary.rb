module Boundary
  def size
    @size ||= V[]
  end
  attr_writer :size

  def width; size[0]; end
  def width=(v); self.size[0] = v; end

  def height; size[1]; end
  def height=(v); self.size[1] = v; end

  def depth; size[2]; end
  def depth=(v); self.size[2] = v; end
end
