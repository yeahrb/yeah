describe DesktopWindow, '#release' do
  let(:instance) { described_class.new }
  let(:pressables_keys) {
    [(:a..:z).to_a, (:A..:Z).to_a, (0..9).to_a, :up, :down, :left, :right]
    .flatten
  }
  subject { instance.method(:release) }

  it { expect {instance.release}.to raise_error ArgumentError }

  it "causes #pressing?(pressable) to equal false" do
    pressable = pressables_keys.sample
    instance.press pressable
    instance.release pressable
    instance.pressing?(pressable).should be_false
  end
end
