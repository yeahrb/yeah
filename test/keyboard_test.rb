class KeyboardTest < Test
  def setup
    @class = Keyboard
    @object = @class.new(ticker: Ticker.new)
  end

  def test_implements_keyboard_interface
    methods = %i[pressing? pressed? released?]

    methods.each do |method|
      assert_respond_to(@object, method)
    end
  end
end
