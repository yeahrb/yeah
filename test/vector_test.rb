class VectorTest < Test
  def setup
    @class = Vector
    @object = @class[0, 0, 0]
  end

  def test_implements_vector_interface
    assert_respond_to(@class, :[])

    assert_respond_to(@object, :[])
    assert_respond_to(@object, :components)

    %i[+@ -@ + - * /].each do |symbol|
      assert_respond_to(@object, symbol)
    end

    %i[x y z].each do |a|
      assert_respond_to(@object, a)
      assert_respond_to(@object, "#{a}=")
    end

    %i[distance_to angle_to].each do |method|
      assert_respond_to(@object, method)
    end

    %i[along toward].each do |method|
      assert_respond_to(@object, method)
      assert_respond_to(@object, "#{method}!")
    end
  end
end
