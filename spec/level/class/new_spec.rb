describe Level, '::new' do
  it { described_class.new.should be_instance_of described_class }

  it "accepts properties hash" do
    properties = {
      background: [1, 0.5, 1, 0.51]
    }
    instance = described_class.new(properties)

    expect(instance.background).to eq properties[:background]
  end
end
