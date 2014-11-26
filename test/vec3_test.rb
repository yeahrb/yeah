class Vec3Test < Test
  def setup
    @object = Vec3
  end

  def test_implements_vec2_interface
    methods = %i[equal? magnitude length normalize add subtract multiply divide
                 dot_product cross_product distance_to]
    methods.each do |method|
      assert_respond_to(@object, method)
    end
  end

  def test_equal?
    assert(@object.equal?(10, 4, 2, 10, 4, 2))
  end

  def test_magnitude
    assert_equal(5, @object.magnitude(3, 0, 4))
  end

  def test_normalize
    assert_equal([0.6, 0, 0.8], @object.normalize(3, 0, 4))
  end

  def test_add
    assert_equal([8, 6, 4], @object.add(5, 4, 3, 3, 2, 1))
  end

  def test_subtract
    assert_equal([2, 2, 2], @object.subtract(5, 4, 3, 3, 2, 1))
  end

  def test_multiply
    assert_equal([15, 12, 9], @object.multiply(5, 4, 3, 3))
  end

  def test_divide
    assert_equal([5, 4, 3], @object.divide(15, 12, 9, 3))
  end

  def test_dot_product
    assert_equal(-1, @object.dot_product(0, 1, 0, 0, -1, 0))
  end

  def test_cross_product
    assert_equal([1, -1, 1], @object.cross_product(0, 1, 1, -1, -1, 0))
  end

  def test_distance_to
    assert_equal(5, @object.distance_to(10, 10, 10, 13, 10, 14))
  end
end
