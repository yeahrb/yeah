module Yeah

# Base is the base for Yeah classes intended to be subclassed for a game.
# Game, Space, Thing and Look inherit from Base.
class Base
  def self.class_attr(name)
    ivar_name = "@#{name}"
    writer_name = "#{name}="

    define_singleton_method(name) do
      instance_variable_get(ivar_name)
    end

    define_singleton_method(writer_name) do |value|
      instance_variable_set(ivar_name, value)
    end

    define_method(name) do
      ivar = instance_variable_get(ivar_name)

      if ivar.nil?
        instance_variable_set(ivar_name, self.class.send(name))
      else
        ivar
      end
    end

    define_method(writer_name) do |value|
      instance_variable_set(ivar_name, value)
    end
  end
end

end
