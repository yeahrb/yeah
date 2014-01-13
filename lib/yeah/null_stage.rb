require 'naught'

Yeah::NullStage = Naught.build do |config|
  def entities
    []
  end

  def instance_of?(klass)
    klass == NullStage
  end
end
