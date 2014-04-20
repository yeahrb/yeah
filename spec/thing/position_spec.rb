describe Thing do
  describe '#position' do
    include_examples :reader, :position

    its(:position) { should eq V[] }
  end

  describe '#position=' do
    include_examples :writer, :position=, random_vector
    include_examples :coerces_to_vector, :anchor=
  end
end
