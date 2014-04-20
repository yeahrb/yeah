describe Vector, '#to_a' do
  describe '#to_a' do
    it "is #components" do
      subject.components = random_vector

      expect(subject.to_a).to eq subject.components
    end
  end
end
