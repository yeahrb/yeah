describe Entity do
  describe '#size' do
    let(:instance) { described_class.new }
    subject { instance.size }

    it { should eq V[] }

    it "is implied by visual size" do
      size = random_vector
      instance.visual = Struct.new(:size).new(size) # todo: use null visual
      instance.size.should eq size
    end

    it "is not implied by visual size after size is explicitly set" do
      size = random_vector
      instance.size = size
      instance.visual = Struct.new(:size).new(size) # todo: use null visual
      instance.size.should eq size
    end
  end

  describe 'size=' do
    subject { described_class.new.method(:size=) }

    it_behaves_like 'writer', random_vector
    it_behaves_like :coerces_to_vector, random_vector.to_a
  end
end
