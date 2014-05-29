class CTest < Unit::TestCase
  include Yeah

  def setup
    @c = C[0, 0, 0]
  end

  def test_implements_c_interface
    assert_respond_to(C, :[])

    %i[value ==].each { |m| assert_respond_to(@c, m) }
  end
end
