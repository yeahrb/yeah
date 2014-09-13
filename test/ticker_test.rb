class TickerTest < Test
  def setup
    @class = Ticker
    @object = @class.new
  end

  def test_implements_image_interface
    methods = %i[rate on_tick]

    methods.each do |method|
      assert_respond_to(@object, method)
    end
  end
end
