class Numeric
  def limit(value)
    polarity = self > 0 ? +1 : -1
    value = value * polarity

    self.abs > value.abs ? value : self
  end
end
