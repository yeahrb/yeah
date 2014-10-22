class Vec2Test < Test
  def setup
    @object = Vec2
  end

  def test_implements_vec2_interface
    methods = %i[equal? magnitude direction length normalize add subtract
                 multiply divide dot_product distance_to direction_to]
    methods.each do |method|
      assert_respond_to(@object, method)
    end
  end

  def test_equal?
    assert(@object.equal?(10, 4, 10, 4))
  end

  def test_magnitude
    assert_equal(5, @object.magnitude(3, 4))
  end

  def test_direction
    assert_equal(0, @object.direction(5, 0))
  end

  def test_normalize
    assert_equal([0.6, 0.8], @object.normalize(3, 4))
  end

  def test_add
    assert_equal([8, 6], @object.add(5, 4, 3, 2))
  end

  def test_subtract
    assert_equal([2, 2], @object.subtract(5, 4, 3, 2))
  end

  def test_multiply
    assert_equal([15, 12], @object.multiply(5, 4, 3))
  end

  def test_divide
    assert_equal([5, 4], @object.divide(15, 12, 3))
  end

  def test_dot_product
    assert_equal(-1, @object.dot_product(1, 0, -1, 0))
  end

  def test_distance_to
    assert_equal(5, @object.distance_to(10, 10, 13, 14))
  end

  def test_direction_to
    assert_equal(0, @object.direction_to(10, 10, 15, 10))
  end
end
