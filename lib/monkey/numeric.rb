class Numeric
  def limit(value)
    polarity = self > 0 ? +1 : -1
    self.abs > value.abs ? value * polarity : self
  end
end
