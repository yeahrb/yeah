require 'yeah/web'

class DisplayTest < Test
  include Yeah::Web

  def setup
    `document.body.appendChild(document.createElement('canvas'))`

    @object = Display.new(
      canvas_selector: 'canvas',
      size: V[400, 400]
    )
  end

  def test_implements_display_interface
    methods = %i[size size= fill fill= color_at rectangle]
    methods.each { |m| assert_respond_to(@object, m) }
  end

  def test_rectangle_fills_area_with_color
    position = V[100, 200]
    size =     V[100, 100]
    color =    C[255, 128, 0]

    @object.fill = color
    @object.rectangle(position, size)

    topleft = position
    middle = V[position.x + size.x / 2, position.y + size.y / 2]
    bottomright = V[position.x + size.x - 1, position.y + size.y - 1]

    [topleft, middle, bottomright].each do |position|
      assert_equal(color.value, @object.color_at(position).value)
    end
  end
end
