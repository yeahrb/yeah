require 'naught'

Yeah::NullContext = Naught.build do |config|
  def each_tick(&block)
    yield
  end

  def instance_of?(klass)
    klass == NullContext
  end
end
