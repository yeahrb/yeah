class Yeah::Rectangle
  def initialize(*arguments)
    err_msg = "too few arguments (#{arguments.count} for at least 1)"
    raise ArgumentError, err_msg
  end
end
