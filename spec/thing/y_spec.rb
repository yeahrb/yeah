describe Thing do
  before { subject.position = random_vector }

  describe '#y' do
    its(:y) { should eq subject.position.y }
  end

  describe '#y=' do
    it "writes #position.y" do
      subject.y = Random.rand(10)

      expect(subject.position.y).to eq subject.y
    end
  end
end
