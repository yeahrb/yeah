describe Game do
  let(:mock_screen) { Struct.new(:resolution).new(V[256, 240]) }
  let(:mock_context) { Struct.new(:screen).new(mock_screen) }
  subject { described_class.new({}, mock_context) }

  include_examples :has_accessor, :resolution do
    let(:default) { V[640, 360] }
    let(:assignables) { [V[100, 100]] }
  end

  describe '#resolution' do
    it "is context's screen's resolution" do
      expect(subject.resolution).to eq mock_context.screen.resolution
    end

    it "defaults to class resolution if it exists" do
      resolution = V[21, 32]

      subclass = Class.new(described_class)

      subclass.new({}, mock_context).resolution.should eq V[640, 360]
      subclass.resolution = resolution
      subclass.new({}, mock_context).resolution.should eq resolution
    end
  end

  describe '#resolution=' do
    it "sets splatted array as context's resolution" do
      subject.resolution = 100, 100
      expect(mock_context.screen.resolution).to eq V[100, 100]
    end
  end
end
