describe Space do
  let(:instance) { described_class.new }

  describe '#background' do
    subject { instance.background }

    it { should eq Color[] }
  end

  describe '#background=' do
    subject { instance.method(:background=) }

    it_behaves_like :writer, Color[*[Random.rand(255)]*4]

    it "converts array to Color" do
      subject.call([0.1, 0.2, 0.4])

      instance.background.should be_instance_of Color
    end
  end
end
