describe Entity do
  describe '#size' do
    let(:instance) { described_class.new }
    subject { instance.size }

    it { should eq V[] }

    it "is implied by visual size" do
      size = V[10, 10]
      instance.visual = Rectangle.new(size)
      instance.size.should eq size
    end

    it "is not implied by visual size after size is explicitly set" do
      size = V[10, 10]
      instance.size = size
      instance.visual = Rectangle.new(size*2)
      instance.size.should eq size
    end
  end

  describe 'size=' do
    subject { described_class.new.method(:size=) }
    it_behaves_like 'writer', V.random(10)
  end
end
