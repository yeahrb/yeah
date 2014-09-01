class VectorTest < Test
  def setup
    @class = Vector
    @object = @class[0, 3, 4]
  end

  def test_implements_vector_interface
    assert_respond_to(@class, :[])

    %i[[] +@ -@ + - * / ==].each do |symbol|
      assert_respond_to(@object, symbol)
    end

    %i[x y z components].each do |attr|
      assert_respond_to(@object, attr)
      assert_respond_to(@object, "#{attr}=")
    end

    %i[distance_to angle_to magnitude length normalize unit].each do |method|
      assert_respond_to(@object, method)
    end

    %i[along toward].each do |method|
      assert_respond_to(@object, method)
      assert_respond_to(@object, "#{method}!")
    end
  end

  def test_length
    assert_equal(5, @object.length)
  end

  def test_normalize
    assert_equal(1, @object.normalize.length)
  end

  def test_equality
    assert(@object == @class[0, 3, 0] + @class[0, 0, 4])
  end

  def test_add
    assert_equal(@class[0, 6, 8], @object + @object)
  end

  def test_subtract
    assert_equal(@class[], @object - @object)
  end

  def test_multiply
    assert_equal(@class[0, 9, 12], @object * 3)
  end

  def test_divide
    assert_equal(@class[0.0, 1.5, 2.0], @object / 2.0)
  end

  def test_add_bang
    object = @object.dup
    object.add! @object
    assert_equal([0, 6, 8], object.components)
  end

  def test_subtract_bang
    object = @object.dup
    object.subtract! @object
    assert_equal([0, 0, 0], object.components)
  end

  def test_multiply_bang
    object = @object.dup
    object.multiply! 3
    assert_equal([0, 9, 12], object.components)
  end

  def test_divide_bang
    object = @object.dup
    object.divide! 2.0
    assert_equal([0.0, 1.5, 2.0], object.components)
  end

  def test_negative
    assert_equal(@class[0, -3, -4], -@object)
  end

  def test_distance_to
    assert_equal(10, @object.distance_to(@class[0, 9, 12]))
  end

  def test_angle_to
    assert_equal(Math::PI, @object.angle_to(@class[-1, 3, 0]))
  end

  def test_along
    assert_equal(@class[-1.5, 3.0, 4], @object.along(Math::PI, 1.5))
  end

  def test_along_bang
    object = @object.dup
    object.along! Math::PI, 1.5
    assert_equal(object.components, [-1.5, 3.0, 4])
  end

  def test_toward
    assert_equal(@class[0.0, 4.5, 6.0], @class[0.0, 1.5, 2].toward(@object, 5))
  end

  def test_toward_bang
    object = @class[0.0, 1.5, 2]
    object.toward! @object, 5
    assert_equal([0.0, 4.5, 6.0], object.components)
  end
end
