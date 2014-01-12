describe DesktopWindow, '#pressing?' do
  let(:instance) { described_class.new }
  let(:pressables_keys) {
    [(:a..:z).to_a, (:A..:Z).to_a, (0..9).to_a, :up, :down, :left, :right]
    .flatten
  }
  subject { instance.method(:pressing?) }

  it { expect {instance.pressing?}.to raise_error ArgumentError }
  it { pressables_keys.each { |pk| instance.pressing?(pk).should be_false }}
  it { instance.pressing?(*pressables_keys[0..2]).should be_false }

  it "returns true if any signle argument would return true" do
    instance.press :a
    instance.pressing?(:z, :a).should be_true
  end
end
