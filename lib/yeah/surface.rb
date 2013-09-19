class Yeah::Surface
  attr_reader :size
  attr_writer :data

  def initialize(size=Vector[])
    self.size = size
  end

  def size=(value)
    @size = value
    @data = "\x00" * 4 * size.x * size.y
  end

  def data(format=:rgba)
    case format
    when :rgba
      @data
    when :bgra
      @data.scan(/.{4}/).map { |p| p[2] + p[1] + p[0] + p[3] }.join
    end
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

  def draw(surface, position=Vector[0, 0])
    data_lines = data.scan(/.{#{size.x*4}}/)
    surface_data_lines = surface.data.scan(/.{#{surface.size.x*4}}/)

    (position.y...position.y+surface.size.height).each_with_index do |y, i|
      line = data_lines[y]
      surface_line = surface_data_lines[i]

      line[position.x*4...(position.x+surface.size.width+1)*4] = surface_line
    end

    @data = data_lines.join
  end
end
