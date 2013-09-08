class Yeah::Shape
  def initialize(*arguments)
    err_msg = "too few arguments (#{arguments.count} for at least 2)"
    raise ArgumentError, err_msg
  end
end
