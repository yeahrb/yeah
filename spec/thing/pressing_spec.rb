describe Thing, '#pressing?' do
  it { subject.protected_methods.should include :pressing? }

  it { expect {subject.send(:pressing?)}.to raise_error ArgumentError }

  it "defers to #game#pressing?" do
    subject.space = Space.new
    subject.space.game = Game.new
    subject.game.should receive(:pressing?).with(:e)
    subject.send(:pressing?, :e)
  end
end
