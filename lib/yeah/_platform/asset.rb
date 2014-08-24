module Yeah

# An `Asset` represents a file found in a project's `assets/` directory.
# @abstract Provided by a `Platform`, subclassed to more specific assets.
class Asset
  # @param [String] path relative to `assets/`
  def initialize(path)
    raise NotImplementedError
  end

  class << self
    # @!method [](*args)
    # @param arguments catch-all
    # @return [Asset]
    # Alias for ::new.
  end

  # @!attribute [r] path
  # @return [String] path to asset relative to `assets/`
end
end
