class VectorTest < Test
  def setup
    @class = Yeah::Vector
    @v = @class[0, 0, 0]
  end

  def test_implements_vector_interface
    assert_respond_to(@class, :[])

    %i[x y z].each { |a|
      assert_respond_to(@v, a)
      assert_respond_to(@v, "#{a}=") }
  end
end
