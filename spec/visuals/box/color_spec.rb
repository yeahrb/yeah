describe Box do
  let(:instance) { described_class.new }

  describe '#color' do
    subject { instance.color }

    it { should eq Color[0, 0, 0] }

    it "defaults to class color if it exists" do
      color = Color[0.2, 0.2, 0.3]
      subclass = Class.new(described_class)

      subclass.new.color.should eq Color[0, 0, 0]
      subclass.color = color
      subclass.new.color.should eq color
    end
  end

  describe '#color=' do
    subject { instance.method(:color=) }

    it_behaves_like :writer, random_vector
  end
end
