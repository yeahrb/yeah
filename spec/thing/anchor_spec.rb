describe Thing do
  describe '#anchor' do
    include_examples :reader, :anchor

    its(:anchor) { should eq V[] }
  end

  describe '#anchor=' do
    include_examples :writer, :anchor=, random_vector

    #include_examples :coerces_to_vector, :anchor=
    it "coerces given value to vector" do
      value = [1, 2, 3]
      subject.anchor = value

      expect(subject.anchor).to eq Vector[value]
    end
  end
end
