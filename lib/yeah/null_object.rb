require 'naught'

Yeah::NullObject = Naught.build do |config|
  def instance_of?(klass)
    klass == NullObject
  end
end
