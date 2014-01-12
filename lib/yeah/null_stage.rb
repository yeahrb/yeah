require 'naught'

Yeah::NullStage = Naught.build do |config|
  def instance_of?(klass)
    klass == NullStage
  end
end
