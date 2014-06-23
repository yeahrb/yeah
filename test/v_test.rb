class VTest < Test
  def setup
    @v = V[0, 0, 0]
  end

  def test_implements_v_interface
    assert_respond_to(V, :[])

    %i[x y z].each { |a|
      assert_respond_to(@v, a)
      assert_respond_to(@v, "#{a}=") }
  end
end
