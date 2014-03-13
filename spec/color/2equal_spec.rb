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
    expect( described_class[*value] == matching_struct ).to be_true
  end

  it "is false for any class of non-matching value" do
    unmatching_struct = Struct.new(:rgb).new(value.reverse)
    expect( described_class[*value] == unmatching_struct ).to be_false
  end

  it "is true for matching RGB array" do
    expect { described_class[value] == value }.to be_true
  end

  it { expect(described_class[value] == nil).to eq false }

  it { expect(described_class[value] == 5).to eq false }
end
