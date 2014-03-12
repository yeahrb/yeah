describe Thing, '::new' do
  it { described_class.new.should be_instance_of described_class }

  it "accepts position" do
    vector = random_vector
    instance = described_class.new(vector)

    expect(instance.position).to eq vector
  end

  it "accepts properties hash" do
    properties = {
      position: random_vector,
      size: random_vector
    }
    instance = described_class.new(properties)

    expect(instance.position).to eq properties[:position]
    expect(instance.size).to eq properties[:size]
  end

  it "accepts properties struct" do
    size = random_vector
    properties = Struct.new(:size).new(size)
    instance = described_class.new(properties)

    expect(instance.size).to eq size
  end
end
