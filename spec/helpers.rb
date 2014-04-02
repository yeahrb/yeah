def random_vector(component_max = 10)
  components = 3.times.collect { Random.rand(component_max) + 1 }
  V[components]
end
