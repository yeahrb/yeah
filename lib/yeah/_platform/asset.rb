module Yeah

# An `Asset` represents a file found in a project's `assets` directory.
# @abstract Provided by a `Platform`, subclassed to more specific assets.
class Asset
  def initialize(path)
    raise NotImplementedError
  end

  class << self
    # @!method [](*args)
    # @param arguments catch-all
    # @return [Asset]
    # Alias for ::new.
  end

  # @!attribute path
  # @param [String] path to asset relative to `assets`
  # @return [String] path to asset relative to `assets`

  # @!method to_n
  # @return [Native] native representation of asset for platform
end
end
