class MouseTest < Test
  def setup
    @class = Mouse
    @object = @class.new(ticker: Ticker.new)
  end

  def test_implements_mouse_interface
    methods = %i[pressing? pressed? released?]

    methods.each do |method|
      assert_respond_to(@object, method)
    end
  end
end
