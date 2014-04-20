describe Space do
  describe '#background' do
    include_examples :reader, :background

    its(:background) { should eq Color[] }
  end

  describe '#background=' do
    include_examples :writer, :background=, Color[0.1, 0.2, 0.3]
    include_examples :coerces_to_color, :background=
  end
end
