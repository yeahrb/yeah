describe Vector do
  describe '#z' do
    it "is #components[2]" do
      subject.components = random_vector

      expect(subject.z).to eq subject.components[2]
    end
  end

  describe '#z=' do
    it "sets #components[2]" do
      subject.z = Random.rand(10)

      expect(subject.components[2]).to eq subject.z
    end
  end
end
