class DisplayTest < Test
  TEST_SQUARE_COLORS = C['#f90'], C['#09f']
  TEST_SQUARE_SIZE = V[64, 64]

  def setup
    @object = Display.new
  end

  def test_implements_display_interface
    methods = %i[color_at push pop stroke_line stroke_rectangle fill_rectangle
      stroke_ellipse fill_ellipse clear begin_shape end_shape move_to line_to
      curve_to curve2_to stroke_shape fill_shape image image_cropped fill_text
      stroke_text]
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

  def test_translate_moves_transformation_by_displacement_in_2d
    displacement = V[50, 25]

    @object.translate(displacement)
    draw_test_square(@object, V[0, 0])

    top_left = displacement
    bottom_left = displacement + V[0, TEST_SQUARE_SIZE.y] - V[0, 1]
    top_right = displacement + V[TEST_SQUARE_SIZE.x, 0] - V[1, 0]
    bottom_right = displacement + TEST_SQUARE_SIZE - V[1, 1]

    assert_equal(TEST_SQUARE_COLORS[0], @object.color_at(top_left),
                 "Top-left square color matches")
    assert_equal(TEST_SQUARE_COLORS[1], @object.color_at(bottom_left),
                 "Bottom-left square color matches")
    assert_equal(TEST_SQUARE_COLORS[1], @object.color_at(top_right),
                 "Top-right square color matches")
    assert_equal(TEST_SQUARE_COLORS[0], @object.color_at(bottom_right),
                 "Bottom-right square color matches")
  end

  def test_scale_scales_transformation_by_multiplier_in_2d
    multiplier = V[2, 3]

    @object.scale(multiplier)
    draw_test_square(@object, V[0, 0])

    top_left = V[0, 0]
    bottom_left = V[0, TEST_SQUARE_SIZE.y * multiplier.y] - V[0, 1]
    top_right = V[TEST_SQUARE_SIZE.x * multiplier.x, 0] - V[1, 0]
    bottom_right = V[TEST_SQUARE_SIZE.x * multiplier.x,
                     TEST_SQUARE_SIZE.y * multiplier.y] - V[1, 1]

    assert_equal(TEST_SQUARE_COLORS[0], @object.color_at(top_left),
                 "Top-left square color matches")
    assert_equal(TEST_SQUARE_COLORS[1], @object.color_at(bottom_left),
                 "Bottom-left square color matches")
    assert_equal(TEST_SQUARE_COLORS[1], @object.color_at(top_right),
                 "Top-right square color matches")
    assert_equal(TEST_SQUARE_COLORS[0], @object.color_at(bottom_right),
                 "Bottom-right square color matches")
  end

  private

  # Fill square divided into 4 squares of alternating color.
  def draw_test_square(object, position)
    half_size = TEST_SQUARE_SIZE / 2

    object.fill_color = TEST_SQUARE_COLORS[0]
    object.fill_rectangle(position, TEST_SQUARE_SIZE)

    object.fill_color = TEST_SQUARE_COLORS[1]
    object.fill_rectangle(position + V[half_size.x, 0], half_size)
    object.fill_rectangle(position + V[0, half_size.y], half_size)
  end
end
