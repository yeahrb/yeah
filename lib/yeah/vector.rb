require 'matrix'

module Yeah
class Vector < Vector
  %i[x y z].each_with_index do |component, i|
    define_method(component) { self[i] }
    define_method("#{component}=") { |v| self[i] = v }
  end
end
end

Yeah::V = Yeah::Vector
