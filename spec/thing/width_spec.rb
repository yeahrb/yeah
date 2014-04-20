describe Thing do
  before { subject.size = random_vector }

  describe '#width' do
    its(:width) { should eq subject.size.x }
  end

  describe '#width=' do
    it "writes #size.x" do
      subject.width = Random.rand(10)

      expect(subject.size.x).to eq subject.width
    end
  end
end
