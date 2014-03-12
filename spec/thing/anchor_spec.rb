describe Thing do
  let(:instance) { described_class.new }

  describe '#anchor' do
    subject { instance.anchor }

    it { should eq V[] }
  end

  describe '#anchor=' do
    subject { instance.method(:anchor=) }

    it_behaves_like 'writer', random_vector
    it_behaves_like :coerces_to_vector, random_vector.to_a
  end
end
