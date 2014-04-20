describe Thing do
  before { subject.position = random_vector }

  describe '#z' do
    its(:z) { should eq subject.position.z }
  end

  describe '#z=' do
    it "writes #position.z" do
      subject.z = Random.rand(10)

      expect(subject.position.z).to eq subject.z
    end
  end
end
