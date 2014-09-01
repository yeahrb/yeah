class ColorTest < Test
  def setup
    @class = Color
    @object = @class[0, 0, 0]
  end

  def test_implements_color_interface
    assert_respond_to(@class, :[])

    %i[value == to_hex].each do |method|
      assert_respond_to(@object, method)
    end
  end

  def test_initializes_with_bytes
    assert_equal([255, 128, 0], @class[255, 128, 0].value)
  end

  def test_initializes_with_hex_string
    assert_equal([255, 128, 0], @class['#ff8000'].value)
  end

  def test_initializes_with_short_hex_string
    assert_equal([255, 136, 0], @class['#f80'].value)
  end

  def test_to_hex
    assert_equal('#00ff80', @class[0, 255, 128].to_hex)
  end

  def test_equality
    assert(@class['#00ff80'] == @class[0, 255, 128])
  end
end
