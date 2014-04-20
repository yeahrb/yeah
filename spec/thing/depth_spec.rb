describe Thing do
  before { subject.size = random_vector }

  describe '#depth' do
    its(:depth) { should eq subject.size.z }
  end

  describe '#depth=' do
    it "writes #size.z" do
      subject.depth = Random.rand(10)

      expect(subject.size.z).to eq subject.depth
    end
  end
end
