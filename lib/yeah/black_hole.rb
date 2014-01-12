require 'naught'

Yeah::BlackHole = Naught.build do |config|
  config.black_hole

  def instance_of?(klass)
    klass == BlackHole
  end
end
