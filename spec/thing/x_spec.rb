describe Thing do
  before { subject.position = random_vector }

  describe '#x' do
    its(:x) { should eq subject.position.x }
  end

  describe '#x=' do
    it "writes #position.x" do
      subject.x = Random.rand(10)

      expect(subject.position.x).to eq subject.x
    end
  end
end
