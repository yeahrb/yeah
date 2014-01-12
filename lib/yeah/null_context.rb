require 'naught'

Yeah::NullContext = Naught.build do |config|
  def instance_of?(klass)
    klass == NullContext
  end

  def each_tick(&block)
    yield
  end
end
