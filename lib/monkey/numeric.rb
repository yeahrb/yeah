class Numeric
  def limit(value)
    sign_mult = self <=> 0
    self.abs > value.abs ? value * sign_mult : self
  end
end
