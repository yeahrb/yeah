describe Box do
  let(:instance) { described_class.new }

  describe '#size' do
    subject { instance.size }

    it { should eq V[] }

    it "defaults to class size if it exists" do
      size = V[2, 3, 3]
      subclass = Class.new(described_class)

      subclass.new.size.should eq V[0, 0, 0]
      subclass.size = size
      subclass.new.size.should eq size
    end
  end

  describe '#size=' do
    subject { instance.method(:size=) }

    it_behaves_like :writer, random_vector
  end
end
