class ColorTest < Test
  def setup
    @class = Color
    @object = @class.new(0, 0, 0)
  end

  def test_implements_color_interface
    %i[value == to_hex].each do |method|
      assert_respond_to(@object, method)
    end
  end

  def test_initializes_with_bytes
    assert_equal([255, 128, 0, 1.0], @class.new(255, 128, 0).value)
  end

  def test_initializes_with_bytes_and_alpha
    assert_equal([255, 128, 0, 0.5], @class.new(255, 128, 0, 0.5).value)
  end

  def test_initializes_with_hex_string
    assert_equal([255, 128, 0, 1.0], @class.new('#ff8000').value)
  end

  def test_initializes_with_hex_string_and_alpha
    assert_equal([255, 128, 0, 0.5], @class.new('#ff8000', 0.5).value)
  end

  def test_initializes_with_short_hex_string
    assert_equal([255, 136, 0, 1.0], @class.new('#f80').value)
  end

  def test_initializes_with_short_hex_string_and_alpha
    assert_equal([255, 136, 0, 0.5], @class.new('#f80', 0.5).value)
  end

  def test_to_hex
    assert_equal('#00ff80', @class.new(0, 255, 128, 0.5).to_hex)
  end

  def test_equality
    assert(@class.new('#00ff80', 0.5) == @class.new(0, 255, 128, 0.5))
  end
end
