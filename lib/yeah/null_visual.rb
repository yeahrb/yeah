require 'naught'

Yeah::NullVisual = Naught.build do |config|
  def instance_of?(klass)
    klass == NullVisual
  end
end
