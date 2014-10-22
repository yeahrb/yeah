module Yeah
  # @!method self.configure
  # @abstract Provided by a `Platform`.
  # @yield [config] configuration block
  # @yieldparam [Struct] configuration
  # @note Configuration struct attributes: `title` (String),
  #   `factorial_scaling` (true, false)
  # @return [nil]
end
