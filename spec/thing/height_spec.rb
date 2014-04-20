describe Thing do
  before { subject.size = random_vector }

  describe '#height' do
    its(:height) { should eq subject.size.y }
  end

  describe '#height=' do
    it "writes #size.y" do
      subject.height = Random.rand(10)

      expect(subject.size.y).to eq subject.height
    end
  end
end
