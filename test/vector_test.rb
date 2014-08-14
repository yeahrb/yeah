class VectorTest < Test
  def setup
    @class = Vector
    @object = @class[0, 0, 0]
  end

  def test_implements_vector_interface
    assert_respond_to(@class, :[])

    assert_respond_to(@object, :[])
    assert_respond_to(@object, :components)
    assert_respond_to(@object, :to_a)

    %i[+@ -@ + - * /].each do |symbol|
      assert_respond_to(@object, symbol)
    end

    %i[x y z].each do |a|
      assert_respond_to(@object, a)
      assert_respond_to(@object, "#{a}=")
    end

    %i[distance_to direction_to move_along move_toward].each do |method|
      assert_respond_to(@object, method)
    end
  end
end
