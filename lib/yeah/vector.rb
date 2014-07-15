require 'forwardable'

module Yeah
class Vector
  extend Forwardable

  class << self
    private :new

    def [](*args)
      new(*args)
    end
  end

  attr_reader :components
  alias_method :to_a, :components
  def_delegators :@components, :[]

  def initialize(*components)
    @components = components
  end

  %i[x y z].each_with_index do |component, i|
    define_method(component) { @components[i] }
    define_method("#{component}=") { |v| @components[i] = v }
  end
end
end

Yeah::V = Yeah::Vector
