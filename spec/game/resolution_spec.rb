describe Game do
  let(:resolution) { V[256, 240] }
  let(:mock_context) { Struct.new(:resolution).new(resolution) }
  let(:instance) { described_class.new(mock_context) }

  describe '#resolution' do
    it "is context's resolution" do
      expect(instance.resolution).to eq resolution
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
