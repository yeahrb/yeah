describe ColoredBox, '::new' do
  it "accepts a size" do
    size = random_vector
    instance = described_class.new(size)

    expect(instance.size).to eq size
  end

  it "accepts a color" do
    color = Color[0.5, 0.4, 0.3]
    instance = described_class.new(V[], color)

    expect(instance.color).to eq color
  end
end
