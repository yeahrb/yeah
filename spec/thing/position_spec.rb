describe Thing do
  describe '#position' do
    include_examples :reader, :position

    its(:position) { should eq V[] }
  end

  describe '#position=' do
    include_examples :writer, :position=, random_vector

    #include_examples :coerces_to_vector, :anchor=
    it "coerces given value to vector" do
      value = [1, 2, 3]
      subject.position = value

      expect(subject.position).to eq Vector[value]
    end
  end
end
