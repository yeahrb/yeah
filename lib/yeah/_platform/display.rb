module Yeah

# The `Display` is responsible for drawing to a game display. It provides a
# procedural drawing API similar to Processing or HTML5 Canvas.
# @abstract Provided by a `Platform`.
class Display
  # @param [Hash] options for new object
  # @option options [Integer] :width (1280) of display
  # @option options [Integer] :height (720) of display
  # @option options [String] :canvas_selector ('canvas') for canvas HTML
  #   element (applies only to `Web::Display`)
  def initialize(options = {})
    raise NotImplementedError
  end

  # @!attribute width
  # @param [Integer] width to make display in pixels
  # @return [Integer] width of display in pixels

  # @!attribute height
  # @param [Integer] height to make display in pixels
  # @return [Integer] height of display in pixels

  # @!attribute size
  # @param [Array<Integer>] size to make display in pixels
  # @return [Array<Integer>] size of display in pixels

  # @!attribute fill_color
  # @param [Color] color for fill
  # @return [Color] color for fill

  # @!attribute stroke_color
  # @param [Color] color for stroke
  # @return [Color] color for stroke

  # @!attribute stroke_width
  # @param [Numeric] width for stroke in pixels
  # @return [Numeric] width for stroke in pixels

  # @!attribute text_font
  # @param [Font] font for text
  # @return [Font] font for text

  # @!attribute text_size
  # @param [Integer] size for text in pixels
  # @return [Integer] size for text in pixels

  # @!method color_at(x, y)
  # @param [Integer] x position of pixel to get color from
  # @param [Integer] y position of pixel to get color from
  # @return [Color] color of pixel

  # @!method translate(x, y)
  # @param [Numeric] x axis displacement
  # @param [Numeric] y axis displacement
  # @return [nil]
  # Move the transformation by a 2D displacement.

  # @!method translate_x(x)
  # @param [Numeric] x axis displacement
  # @return [nil]
  # Move the transformation by a displacement on the X axis.

  # @!method translate_y(y)
  # @param [Numeric] y axis displacement
  # @return [nil]
  # Move the transformation by a displacement on the Y axis.

  # @!method scale(x, y)
  # @param [Numeric] x axis multiplier
  # @param [Numeric] y axis multiplier
  # @return [nil]
  # Scale the transformation by a 2D multiplier.

  # @!method scale_x(x)
  # @param [Numeric] x axis multiplier
  # @return [nil]
  # Scale the transformation by a multiplier on the X axis.

  # @!method scale_y(y)
  # @param [Numeric] y axis multiplier
  # @return [nil]
  # Scale the transformation by a multiplier on the Y axis.

  # @!method rotate(radians)
  # @param [Numeric] radians
  # @return [nil]
  # Rotate the transformation in 2D by radians.

  # @!method push
  # @return [nil]
  # Push current transformation to the transformation stack.

  # @!method pop
  # @return [nil]
  # Pop a transformation off the transformation stack and use it.

  # @!method stroke_line(start_x, start_y, end_x, end_y)
  # @param [Numeric] start x position
  # @param [Numeric] start y position
  # @param [Numeric] end x position
  # @param [Numeric] end y position
  # @return [nil]
  # Stroke a line between two positions.

  # @!method stroke_curve(start_x, start_y, end_x, end_y, control_x, control_y)
  # @param [Numeric] start x position
  # @param [Numeric] start y position
  # @param [Numeric] end x position
  # @param [Numeric] end y position
  # @param [Numeric] control point x position
  # @param [Numeric] control point y position
  # @return [nil]
  # Stroke curve with a control point between two positions.

  # @!method stroke_curve2(start_x, start_y, end_x, end_y, control1_x, control1_y, control2_x, control2_y)
  # @param [Numeric] start x position
  # @param [Numeric] start y position
  # @param [Numeric] end x position
  # @param [Numeric] end y position
  # @param [Numeric] first control point x position
  # @param [Numeric] first control point y position
  # @param [Numeric] second control point x position
  # @param [Numeric] second control point y position
  # @return [nil]
  # Stroke curve with 2 control points between two positions.

  # @!method stroke_rectangle(x, y, width, height)
  # @param [Numeric] x position
  # @param [Numeric] y position
  # @param [Numeric] width
  # @param [Numeric] height
  # @return [nil]
  # Stroke a rectangle at a position and size.

  # @!method fill_rectangle(x, y, width, height)
  # @param [Numeric] x position
  # @param [Numeric] y position
  # @param [Numeric] width
  # @param [Numeric] height
  # @return [nil]
  # Fill a rectangle at a position and size.

  # @!method stroke_ellipse(center_x, center_y, radius_x, radius_y)
  # @param [Numeric] center x position
  # @param [Numeric] center y position
  # @param [Numeric] radius on x axis
  # @param [Numeric] radius on y axis
  # @return [nil]
  # Stroke an ellipse at a center position and 2D radius.

  # @!method fill_ellipse(center_x, center_y, radius_x, radius_y)
  # @param [Numeric] center x position
  # @param [Numeric] center y position
  # @param [Numeric] radius on x axis
  # @param [Numeric] radius on y axis
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

  # @!method move_to(x, y)
  # @param [Numeric] x position
  # @param [Numeric] y position
  # @return [nil]
  # Move shape cursor to position.

  # @!method line_to(x, y)
  # @param [Numeric] x position
  # @param [Numeric] y position
  # @return [nil]
  # Trace line to position as part of shape.

  # @!method curve_to(x, y, control_x, control_y)
  # @param [Numeric] x position
  # @param [Numeric] y position
  # @param [Numeric] control point x position
  # @param [Numeric] control point y position
  # @return [nil]
  # Trace curve with a control point to position as part of shape.

  # @!method curve2_to(x, y, control1_x, control1_y, control2_x, control2_y)
  # @param [Numeric] x position
  # @param [Numeric] y position
  # @param [Numeric] first control point x position
  # @param [Numeric] first control point y position
  # @param [Numeric] second control point x position
  # @param [Numeric] second control point y position
  # @return [nil]
  # Trace curve with 2 control points to position as part of shape.

  # @!method stroke_shape
  # @return [nil]
  # Stroke previously made shape.

  # @!method fill_shape
  # @return [nil]
  # Fill previously made shape.

  # @!method image(image, x, y)
  # @param [Image] image to draw
  # @param [Numeric] x position
  # @param [Numeric] y position
  # @return [nil]
  # @example Draw a duck within a game
  #   display.image(Image['images/duck.png'], 80, 80)
  # Draw an image at a position.

  # @!method image_cropped(image, x, y, crop_x, crop_y, crop_width, crop_height)
  # @param [Image] image to draw
  # @param [Numeric] x position
  # @param [Numeric] y position
  # @param [Numeric] x position of crop
  # @param [Numeric] y position of crop
  # @param [Numeric] width of crop
  # @param [Numeric] height of crop
  # @return [nil]
  # Draw a cropped image at a position.

  # @!method fill_text(text, x, y)
  # @param [String] text value
  # @param [Numeric] x position
  # @param [Numeric] y position
  # @return [nil]
  # Fill text at a position.

  # @!method stroke_text(text, x, y)
  # @param [String] text value
  # @param [Numeric] x position
  # @param [Numeric] y position
  # @return [nil]
  # Stroke text at a position.
end
end
