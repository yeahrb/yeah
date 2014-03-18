describe Game do
  let(:mock_context) { Struct.new(:resolution).new(V[256, 240]) }
  let(:instance) { described_class.new(mock_context) }

  describe '#resolution' do
    it "is context's resolution" do
      expect(instance.resolution).to eq mock_context.resolution
    end

    it "defaults to 720p / 2" do
      expect(instance.resolution).to eq V[640, 360]
    end
  end

  describe '#resolution=' do
    it "sets Vector as context's resolution" do
      instance.resolution = V[100, 100]
      expect(mock_context.resolution).to eq V[100, 100]
    end

    it "sets splatted array as context's resolution" do
      instance.resolution = 100, 100
      expect(mock_context.resolution).to eq V[100, 100]
    end
  end
end
