class Numeric
  def limit(value)
    plus_minus = self <=> 0
    self.abs > value.abs ? value * plus_minus : self
  end
end
