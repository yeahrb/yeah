describe Color, '#==' do
  let(:value) { [0.5, 1, 1] }

  it "is true for itself" do
    color = described_class[0.0, 0.1, 0.2]
    (color == color).should be_true
  end

  it "is true for Color of same value" do
    (described_class[*value] == described_class[*value]).should be_true
  end

  it "is false for Color of different value" do
    (described_class[*value] == described_class[*value.reverse]).should be_false
  end

  it "is true for any class of matching value" do
    matching_struct = Struct.new(:rgb).new(value)
    expect { matching_struct == described_class[*value] }.to be_true
  end

  it { (described_class[] == nil).should be_false }
end
