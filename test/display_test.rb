class DisplayTest < Test
  TEST_SQUARE_COLORS = C['#f90'], C['#09f']
  TEST_SQUARE_SIZE = V[64, 64]

  def setup
    @object = Display.new
  end

  def test_implements_display_interface
    methods = %i[color_at push pop stroke_line stroke_curve stroke_curve2
      stroke_rectangle fill_rectangle stroke_ellipse fill_ellipse clear
      begin_shape end_shape move_to line_to curve_to curve2_to stroke_shape
      fill_shape image image_cropped fill_text stroke_text]
    methods.each { |m| assert_respond_to(@object, m) }

    transform_methods = %i[translate scale rotate]
    transform_methods.each do |transform_method|
      assert_respond_to(@object, transform_method)
      assert_respond_to(@object, "#{transform_method}_x")
      assert_respond_to(@object, "#{transform_method}_y")
      assert_respond_to(@object, "#{transform_method}_z")
    end

    attributes = %i[size width height fill_color stroke_color stroke_width
      text_font text_size]
    attributes.each do |attribute|
      assert_respond_to(@object, attribute)
      assert_respond_to(@object, "#{attribute}=")
    end
  end

  def test_color_at_gets_color_at_position
    position = V[5, 5]

    @object.fill_color = C[0, 128, 255]
    @object.fill_rectangle(position, V[1, 1])

    assert_equal(@object.fill_color, @object.color_at(position))
  end

  def test_stroke_line_strokes_line_with_stroke_color
    pos1 = V[20, 20]
    pos2 = V[40, 80]

    @object.stroke_color = C[255, 128, 0]
    @object.stroke_line(pos1, pos2)

    assert_equal(@object.stroke_color, @object.color_at(pos1),
                 "Start of line color matches")
    assert_equal(@object.stroke_color, @object.color_at(pos2 - pos1),
                 "Middle of line color matches")
    assert_equal(@object.stroke_color, @object.color_at(pos2),
                 "End of line color matches")
  end

  def test_stroke_rectangle_strokes_area_with_stroke_color
    position = V[100, 200]
    size = V[100, 100]

    @object.stroke_color = C[255, 128, 0]
    @object.stroke_rectangle(position, size)

    top_left = position
    bottom_right = position + size - V[1, 1]

    assert_equal(@object.stroke_color, @object.color_at(top_left),
                 "Top-left rectangle color matches")
    assert_equal(@object.stroke_color, @object.color_at(bottom_right),
                 "Bottom-right rectangle color matches")
  end

  def test_fill_rectangle_fills_area_with_fill_color
    position = V[100, 200]
    size = V[100, 100]

    @object.fill_color = C[255, 128, 0]
    @object.fill_rectangle(position, size)

    top_left = position
    middle = position + size / 2
    bottom_right = position + size - V[1, 1]

    assert_equal(@object.fill_color, @object.color_at(top_left),
                 "Top-left rectangle color matches")
    assert_equal(@object.fill_color, @object.color_at(middle),
                 "Middle rectangle color matches")
    assert_equal(@object.fill_color, @object.color_at(bottom_right),
                 "Bottom-right rectangle color matches")
  end

  def test_clear_fills_everything_with_fill_color
    @object.fill_color = C[255, 128, 0]
    @object.clear

    assert_equal(@object.fill_color, @object.color_at(V[0, 0]),
                 "Top-left color matches")
    assert_equal(@object.fill_color, @object.color_at(@object.size / 2),
                 "Middle color matches")
    assert_equal(@object.fill_color, @object.color_at(@object.size - V[1, 1]),
                 "Bottom-right color matches")
  end
end
