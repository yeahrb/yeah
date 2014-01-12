describe DesktopWindow, '#press' do
  let(:instance) { described_class.new }
  let(:pressables_keys) {
    [(:a..:z).to_a, (:A..:Z).to_a, (0..9).to_a, :up, :down, :left, :right]
    .flatten
  }

  it { expect {instance.press}.to raise_error ArgumentError }

  it "causes #pressing?(pressable) to equal true" do
    pressable = pressables_keys.sample
    instance.press(pressable)
    instance.pressing?(pressable).should be_true
  end
end
