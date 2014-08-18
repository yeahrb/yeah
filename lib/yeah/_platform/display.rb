module Yeah

# The `Display` is responsible for drawing to a game display. It provides a
# procedural drawing API similar to Processing or HTML5 Canvas.
# @abstract Provided by a `Platform`.
class Display
  # @param [Hash] options for new object
  # @option options [Vector] :size (V[1280, 720]) of display
  # @option options [String] :canvas_selector ('canvas') for canvas HTML
  #   element (applicable only to `Web::Display`)
  def initialize(options = {})
    raise NotImplementedError
  end

  # @!attribute size
  # @param [Vector] size to make display
  # @return [Vector] size of display

  # @!attribute width
  # @param [Vector] width to make display
  # @return [Vector] width of display

  # @!attribute height
  # @param [Vector] height to make display
  # @return [Vector] height of display

  # @!attribute fill_color
  # @param [Color] color for fill
  # @return [Color] color for fill

  # @!attribute stroke_color
  # @param [Color] color for stroke
  # @return [Color] color for stroke

  # @!attribute stroke_width
  # @param [Numeric] width for stroke
  # @return [Numeric] width for stroke

  # @!attribute font_family
  # @param [String] font family for text
  # @return [String] font family for text

  # @!attribute font_size
  # @param [String] font size for text
  # @return [String] font size for text

  # @!method color_at(position)
  # @param [Vector] position of pixel from which to get color
  # @return [Color] color of pixel

  # @!attribute [r] transformation
  # @return [Array] transformation matrix

  # @!method translate(displacement)
  # @param [Vector] displacement in 2D
  # @return [nil]
  # @todo Make this work in 3D.
  # Move the transformation by a 2D displacement.

  # @!method scale(multiplier)
  # @param [Vector] multiplier in 2D
  # @return [nil]
  # @todo Make this work in 3D.
  # Scale the transformation by a 2D multiplier.

  # @!method rotate(radians)
  # @param [Numeric] radians in 2D
  # @return [nil]
  # @todo Make this work in 3D.
  # Rotate the transformation by radians.

  # @!method push
  # @return [nil]
  # Push transformation to the transformation stack.

  # @!method pop
  # @return [nil]
  # Pop a transformation off the transformation stack.

  # @!method stroke_line(start_pos, end_pos)
  # @param [Vector] start position in 2D
  # @param [Vector] end position in 2D
  # @return [nil]
  # Stroke a line between two positions.

  # @!method stroke_rectangle(position, size)
  # @param [Vector] position in 2D
  # @param [Vector] size in 2D
  # @return [nil]
  # Stroke a rectangle at a position and size.

  # @!method fill_rectangle(position, size)
  # @param [Vector] position in 2D
  # @param [Vector] size in 2D
  # @return [nil]
  # Fill a rectangle at a position and size.

  # @!method stroke_ellipse(center, radius)
  # @param [Vector] center position in 2D
  # @param [Vector] radius in 2D
  # @return [nil]
  # Stroke an ellipse at a center position and 2D radius.

  # @!method fill_ellipse(center, radius)
  # @param [Vector] center position in 2D
  # @param [Vector] radius in 2D
  # @return [nil]
  # Fill an ellipse at a center position and 2D radius.

  # @!method clear
  # @return [nil]
  # Clear display with fill color.

  # @!method begin_shape
  # @return [nil]
  # Begin new shape.

  # @!method end_shape
  # @return [nil]
  # End shape.

  # @!method move_to(position)
  # @param [Vector] position
  # @return [nil]
  # Move shape cursor to position.

  # @!method line_to(position)
  # @param [Vector] position
  # @return [nil]
  # Draw line to position as part of shape.

  # @!method curve_to(position, control)
  # @param [Vector] position
  # @param [Vector] control point position
  # @return [nil]
  # Draw curve with a control point to position as part of shape.

  # @!method curve2_to(position, control1, control2)
  # @param [Vector] position
  # @param [Vector] first control point position
  # @param [Vector] second control point position
  # @return [nil]
  # Draw curve with 2 control points to position as part of shape.

  # @!method stroke_shape
  # @return [nil]
  # Stroke previously made shape.

  # @!method fill_shape
  # @return [nil]
  # Fill previously made shape.

  # @!method image(image, position)
  # @param [Image] image to draw
  # @param [Vector] position
  # @return [nil]
  # @example Draw a duck within a game
  #   display.image Image['images/duck.png'], V[80, 80]
  # Draw an image at a position.

  # @!method image_cropped(image, position, crop_position, crop_size)
  # @param [Image] image to draw
  # @param [Vector] position
  # @param [Vector] start point of crop
  # @param [Vector] size of crop
  # @return [nil]
  # Draw a cropped image at a position.

  # @!method fill_text(text, position)
  # @param [String] text value
  # @param [Vector] position
  # @return [nil]
  # Fill text at a position.

  # @!method stroke_text(text, position)
  # @param [String] text value
  # @param [Vector] position
  # @return [nil]
  # Stroke text at a position.
end
end
