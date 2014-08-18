module Yeah
module Platform

# An `Image` is an asset that a `Display` can draw.
# @abstract Provided by a `Platform`.
# @see Yeah::Platform::Display#image
class Image < Asset
  # @!attribute [r] size
  # @return [Vector] size of image

  # @!attribute [r] width
  # @return [Integer] width of image

  # @!attribute [r] height
  # @return [Integer] height of image
end
end
end
