describe Thing do
  describe '#size' do
    include_examples :reader, :size

    its(:size) { should eq V[] }

    it "is implied by look size" do
      subject.look = Look.new

      expect(subject.size).to eq subject.look.size
    end

    it "is not implied by look size after size is explicitly set" do
      value = random_vector
      subject.size = value
      subject.look = Look.new

      expect(subject.size).to eq value
    end
  end

  describe '#size=' do
    include_examples :writer, :size=, random_vector

    #include_examples :coerces_to_vector, :size=
    it "coerces given value to vector" do
      value = [1, 2, 3]
      subject.size = value

      expect(subject.size).to eq Vector[value]
    end
  end
end
