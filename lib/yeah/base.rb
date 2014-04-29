module Yeah

# Base is the base for Yeah classes intended to be subclassed for a game.
# Game, Space, Thing and Look inherit from Base.
class Base
  # Allows for super-overridable dynamic methods.
  module DynamicMethods; end
  include DynamicMethods

  def self.class_attr(name, default = nil)
    ivar_name = "@#{name}"
    writer_name = "#{name}="

    # Class reader
    define_singleton_method(name) do
      ivar = instance_variable_get(ivar_name)

      ivar || instance_variable_set(ivar_name, default)
    end

    # Class writer
    define_singleton_method(writer_name) do |value|
      instance_variable_set(ivar_name, value)
    end

    DynamicMethods.module_eval do
      # Instance reader
      define_method(name) do
        ivar = instance_variable_get(ivar_name)

        ivar || instance_variable_set(ivar_name, self.class.send(name))
      end

      # Instance writer
      define_method(writer_name) do |value|
        instance_variable_set(ivar_name, value)
      end
    end
  end

  # Create a one-to-one circular reference property.
  # TODO: Make more sturdy.
  def self.one_to_one(other_name, self_name)
    ivar_name = "@#{other_name}"

    DynamicMethods.module_eval do
      # Reader
      define_method(other_name) do
        ivar = instance_variable_get(ivar_name)

        if ivar.nil?
          other_class = Kernel.const_get(other_name.capitalize)
          other = other_class.new

          other.instance_variable_set("@#{self_name}", self)

          instance_variable_set(ivar_name, other)
        else
          ivar
        end
      end

      # Writer
      define_method("#{other_name}=") do |value|
        instance_variable_set(ivar_name, value)

        ivar = instance_variable_get(ivar_name)

        if ivar.send(self_name) != self
          ivar.send("#{self_name}=", self)
        end
      end
    end
  end
end

end
