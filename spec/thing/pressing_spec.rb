describe Thing, '#pressing?' do
  let(:instance) { described_class.new }
  subject { instance.method(:pressing?) }

  it { instance.protected_methods.should include :pressing? }

  it { expect {instance.send(:pressing?)}.to raise_error ArgumentError }

  it "defers to #game#pressing?" do
    instance.area = Area.new
    instance.area.game = Game.new
    instance.game.should receive(:pressing?).with(:e)
    instance.send(:pressing?, :e)
  end
end
