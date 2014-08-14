class ColorTest < Test
  def setup
    @class = Color
    @object = @class[0, 0, 0]
  end

  def test_implements_color_interface
    assert_respond_to(@class, :[])

    %i[value == to_s to_hex].each do |method|
      assert_respond_to(@object, method)
    end
  end

  def test_initializes_with_bytes
    assert_equal([255, 128, 0], @class[255, 128, 0].value)
  end

  def test_initializes_with_hex
    assert_equal([255, 128, 0], @class['#ff8000'].value)
  end
end
