module Yeah::Color
  def self.byte_array(from)
    case from
    when Array
      from
    when String
      from.scan(/.{2}/).map { |hex| hex.to_i(16) }
    end
  end
end
