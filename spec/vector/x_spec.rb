describe Vector do
  describe '#x' do
    it "is #components[0]" do
      subject.components = random_vector

      expect(subject.x).to eq subject.components[0]
    end
  end

  describe '#x=' do
    it "sets #components[0]" do
      subject.x = Random.rand(10)

      expect(subject.components[0]).to eq subject.x
    end
  end
end
