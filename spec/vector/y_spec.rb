describe Vector do
  describe '#y' do
    it "is #components[1]" do
      subject.components = random_vector

      expect(subject.y).to eq subject.components[1]
    end
  end

  describe '#y=' do
    it "sets #components[1]" do
      subject.y = Random.rand(10)

      expect(subject.components[1]).to eq subject.y
    end
  end
end
