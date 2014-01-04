describe Entity do
  describe '#position' do
    subject { described_class.new.position }

    it { should be_instance_of Vector }
    its(:components) { should eq [0, 0, 0] }
  end

  describe '#position=' do
    subject { described_class.new.method(:position=) }

    it_behaves_like 'writer', V.random(100)
  end
end
