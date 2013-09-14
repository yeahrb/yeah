class Yeah::Surface
  attr_reader :size
  attr_accessor :data

  def initialize(size=Vector[])
    self.size = size
  end

  def size=(value)
    @size = value
    @data = "\x00" * 4 * size.x * size.y
  end

  def color_at(position)
    data_lines = data.scan(/.{#{size.x*4}}/)
    line = data_lines[position.y]
    color_string = line[position.x*4..position.x*4+3]
    color_bytes = color_string.unpack('H*')[0].
      scan(/.{2}/).map { |b| b.to_i(16) }
    Color[*color_bytes]
  end

  def fill(color, position1=Vector[0, 0], position2=size-1)
    color_byte_string = color.rgba_bytes.pack('C*')
    data_lines = data.scan(/.{#{size.x*4}}/)

    rect_width = (position2.x - position1.x).abs + 1
    (position1.y..position2.y).each do |i|
      line = data_lines[i]
      color_bytes_row = color_byte_string * rect_width
      line[position1.x*4...(position2.x+1)*4] = color_bytes_row
    end

    @data = data_lines.join
  end
end
