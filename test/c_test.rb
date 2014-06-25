class CTest < Test
  def setup
    @c = C[0, 0, 0]
  end

  def test_implements_c_interface
    assert_respond_to(C, :[])

    %i[value ==].each { |m| assert_respond_to(@c, m) }
  end

  def test_initializes_with_bytes
    assert_equal([255, 128, 0], C[255, 128, 0].value)
  end

  def test_initializes_with_hex
    assert_equal([255, 128, 0], C['#ff8000'].value)
  end
end
