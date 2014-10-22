module Yeah

# An `Image` is an asset that a `Display` can draw.
# @note Provided by a `Platform`.
# @see Yeah::Display#image
class Image < Asset
  # @!attribute [r] width
  # @return [Integer] width of image

  # @!attribute [r] height
  # @return [Integer] height of image

  # @!attribute [r] size
  # @return [(Integer, Integer)] size of image

  # @!method to_n
  # @return [Native] native reference
end
end
