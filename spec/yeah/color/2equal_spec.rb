describe Color, '#==' do
  it "is true for itself" do
    color = described_class[55, 54, 53, 52]
    (color == color).should be_true
  end

  it "is true for Color of same value" do
    value = (1..4).map { Random.rand(255) }
    (described_class[*value] == described_class[*value]).should be_true
  end

  it "is false for Color of different value" do
    value = (1..4).map { Random.rand(255) }
    (described_class[*value] == described_class[*value.reverse]).should be_false
  end

  it "is true for any class of matching value" do
    value = (1..4).map { Random.rand(255) }
    matching_struct = Struct.new(:bytes).new(value)
    expect { matching_struct == described_class[*value] }.to be_true
  end

  it { (described_class[] == nil).should be_false }
end
