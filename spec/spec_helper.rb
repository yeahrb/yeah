require 'yeah'

class DummyEntity < Yeah::Entity
  attr_reader :update_count

  def initialize
    super
    @update_count = 0
  end

  def update
    @update_count += 1
  end
end
