class ColorTest < Test
  def setup
    @class = Color
    @object = @class[0, 0, 0]
  end

  def test_implements_color_interface
    assert_respond_to(@class, :[])

    %i[value ==].each { |m| assert_respond_to(@object, m) }
  end

  def test_initializes_with_bytes
    assert_equal([255, 128, 0], @class[255, 128, 0].value)
  end

  def test_initializes_with_hex
    assert_equal([255, 128, 0], @class['#ff8000'].value)
  end
end
